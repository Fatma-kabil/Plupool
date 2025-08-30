// lib/features/select_role/data/repositories/select_role_repository_impl.dart
import 'package:plupool/features/auth/data/datasources/remote_data_sources/select_role_remote_data_source.dart';
import 'package:plupool/features/auth/domain/repos/select_role_repo.dart';

import '../../domain/entities/role.dart';


class SelectRoleRepositoryImpl implements SelectRoleRepository {
  final SelectRoleRemoteDataSource remoteDataSource;
  SelectRoleRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> selectRole(Role role) async {
    return await remoteDataSource.sendRoleToBackend(role);
  }
}
