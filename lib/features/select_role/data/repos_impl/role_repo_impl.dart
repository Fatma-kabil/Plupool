
import 'package:plupool/features/select_role/data/local_data_source/role_local_data_source.dart';
import 'package:plupool/features/select_role/domain/entities/role_entity.dart';
import 'package:plupool/features/select_role/domain/repos/role_repo.dart';

class RoleRepositoryImpl implements RoleRepository {
  final RoleLocalDataSource localDataSource;
  RoleRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveRole(RoleEntity role) async {
    await localDataSource.saveRole(role.name);
  }

  @override
  Future<RoleEntity?> getSavedRole() async {
    final name = await localDataSource.getSavedRole();
    if (name == null) return null;
    return RoleEntity(name);
  }
}
