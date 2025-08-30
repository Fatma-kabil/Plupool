// lib/core/di/injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plupool/features/auth/data/datasources/remote_data_sources/select_role_remote_data_source.dart';
import 'package:plupool/features/auth/domain/repos/select_role_repo.dart';
import 'package:plupool/features/auth/domain/usecases/select_role_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio instance
  sl.registerLazySingleton(() => Dio());

  // Data sources
  sl.registerLazySingleton<SelectRoleRemoteDataSource>(
      () => SelectRoleRemoteDataSourceImpl(sl()));

  // Repository
//  sl.registerLazySingleton<SelectRoleRepository>(
  //    () => SelectRoleRepositoryImpl(sl()));

  // UseCases
  sl.registerLazySingleton(() => SelectRoleUseCase(sl()));

  // Cubit
//  sl.registerFactory(() => SelectRoleCubit(sl()));
}
