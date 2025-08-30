// select_role_repository.dart
import '../entities/role.dart';


abstract class SelectRoleRepository {
Future<void> selectRole(Role role);
//Future<Role?> getSavedRole();
}