import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/auth/data/datasources/otp_remote_data_source.dart';
import 'package:plupool/features/auth/data/repos_impl/otp_repo_impl.dart';
import 'package:plupool/features/auth/data/repos_impl/sign_up_repo_impl.dart';
import 'package:plupool/features/auth/domain/repos/otp_repo.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:plupool/features/profile/data/remote_data_source.dart/get_user_remote_data_source.dart';
import 'package:plupool/features/profile/data/repo_impl/user_repo_impl.dart';
import 'package:plupool/features/profile/domain/repos/user_repo.dart';
import 'package:plupool/features/profile/presentation/manager/user_cubit/user_cubit.dart';

// Role Feature
import 'package:plupool/features/select_role/data/local_data_source/role_local_data_source.dart';
import 'package:plupool/features/select_role/domain/repos/role_repo.dart';
import 'package:plupool/features/select_role/domain/usecases/get_saved_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/save_role_usecase.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/features/select_role/data/repos_impl/role_repo_impl.dart';

// Auth Feature
import 'package:plupool/features/auth/data/datasources/sign_up_remote_data_source.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_company_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_pool_owner_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_technician_usecase.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // ----------------------------
  // 🌐 Core Network
  // ----------------------------
  sl.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://192.168.43.149:8000/api/v1',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  });

  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

  // ----------------------------
  // 🔐 FlutterSecureStorage
  // ----------------------------
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  // ----------------------------
  // 🧱 Role Feature
  // ----------------------------
  sl.registerLazySingleton<RoleLocalDataSource>(() => RoleLocalDataSource());

  sl.registerLazySingleton<RoleRepository>(
    () => RoleRepositoryImpl(sl<RoleLocalDataSource>()),
  );

  sl.registerLazySingleton(() => SaveRoleUseCase(sl<RoleRepository>()));
  sl.registerLazySingleton(() => GetSavedRoleUseCase(sl<RoleRepository>()));

  sl.registerFactory(() => SelectRoleCubit(
        saveRoleUseCase: sl<SaveRoleUseCase>(),
        getSavedRoleUseCase: sl<GetSavedRoleUseCase>(),
      ));

  // ----------------------------
  // 🔐 Auth Feature
  // ----------------------------
  // AuthCubit (يعتمد على FlutterSecureStorage)
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl<FlutterSecureStorage>()));

  // Remote Data Source
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl<ApiService>(), sl<AuthCubit>(), ),
  );

  // Repositories
  sl.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(sl<SignUpRemoteDataSource>()),
  );

  sl.registerLazySingleton<OtpRemoteDataSource>(
    () => OtpRemoteDataSourceImpl(
          sl<ApiService>(),
          sl<AuthCubit>(), // ✅ تمرير الـ AuthCubit
        ),
  );

  sl.registerLazySingleton<OtpRepository>(
    () => OtpRepoImpl(sl<OtpRemoteDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton(() => SignupTechnicianUseCase(sl<SignUpRepo>()));
  sl.registerLazySingleton(() => SignupPoolOwnerUseCase(sl<SignUpRepo>()));
  sl.registerLazySingleton(() => SignupCompanyUseCase(sl<SignUpRepo>()));

  // Cubits
  sl.registerFactory(() => SignUpCubit(
        signupTechnicianUseCase: sl<SignupTechnicianUseCase>(),
        signupPoolOwnerUseCase: sl<SignupPoolOwnerUseCase>(),
        signupCompanyUseCase: sl<SignupCompanyUseCase>(),
      ));

  sl.registerFactory(() => OtpCubit(sl<OtpRepository>()));



  // تسجيل DataSource
sl.registerLazySingleton<UserRemoteDataSource>(
  () => UserRemoteDataSourceImpl(sl<ApiService>()),
);

// تسجيل Repository
sl.registerLazySingleton<UserRepository>(
  () => UserRepositoryImpl(sl<UserRemoteDataSource>()),
);

// تسجيل Cubit
sl.registerFactory(() => UserCubit(sl<UserRepository>()));

}
