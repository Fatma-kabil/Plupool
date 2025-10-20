import '../entities/role_entity.dart';

abstract class RoleRepository {
  Future<void> saveRole(RoleEntity role);
  Future<RoleEntity?> getSavedRole();
}
