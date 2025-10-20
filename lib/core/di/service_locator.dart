import 'package:get_it/get_it.dart';
import 'package:plupool/features/select_role/data/local_data_source/role_local_data_source.dart';
import 'package:plupool/features/select_role/domain/repos/role_repo.dart';
import 'package:plupool/features/select_role/domain/usecases/get_saved_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/save_role_usecase.dart';
import 'package:plupool/features/select_role/presentation/views/manager/select_role_cubit/select_role_cubit.dart';
import 'package:plupool/features/select_role/repos_impl/role_repo_impl.dart'; // ✅ مهم

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // ✅ Data source
  sl.registerLazySingleton<RoleLocalDataSource>(() => RoleLocalDataSource());

  // ✅ Repository
  sl.registerLazySingleton<RoleRepository>(
    () => RoleRepositoryImpl(sl<RoleLocalDataSource>()),
  );

  // ✅ UseCases
  sl.registerLazySingleton(() => SaveRoleUseCase(sl<RoleRepository>()));
  sl.registerLazySingleton(() => GetSavedRoleUseCase(sl<RoleRepository>()));

  // ✅ Cubit registration
sl.registerFactory(() => SelectRoleCubit(
  saveRoleUseCase: sl<SaveRoleUseCase>(),
  getSavedRoleUseCase: sl<GetSavedRoleUseCase>(),
));

}
