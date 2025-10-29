import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/auth/data/repos_impl/sign_up_repo_impl.dart';
import 'package:plupool/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

// Role Feature
import 'package:plupool/features/select_role/data/local_data_source/role_local_data_source.dart';
import 'package:plupool/features/select_role/domain/repos/role_repo.dart';
import 'package:plupool/features/select_role/domain/usecases/get_saved_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/save_role_usecase.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/features/select_role/repos_impl/role_repo_impl.dart';

// Auth Feature
import 'package:plupool/features/auth/data/datasources/sign_up_remote_data_source.dart';
import 'package:plupool/features/auth/domain/repos/sign_up_repo.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_company_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_pool_owner_usecase.dart';
import 'package:plupool/features/auth/domain/usecases/sign_up_usecases/signup_technician_usecase.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // ----------------------------
  // 🌐 Core Network
  // ----------------------------
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

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
  // Remote Data Source
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl<ApiService>()),
  );

  // Repo
  sl.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(sl<SignUpRemoteDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton(() => SignupTechnicianUseCase(sl<SignUpRepo>()));
  sl.registerLazySingleton(() => SignupPoolOwnerUseCase(sl<SignUpRepo>()));
  sl.registerLazySingleton(() => SignupCompanyUseCase(sl<SignUpRepo>()));

  // Cubit
  sl.registerFactory(() => SignUpCubit(
        signupTechnicianUseCase: sl<SignupTechnicianUseCase>(),
        signupPoolOwnerUseCase: sl<SignupPoolOwnerUseCase>(),
        signupCompanyUseCase: sl<SignupCompanyUseCase>(),
      ));
}
