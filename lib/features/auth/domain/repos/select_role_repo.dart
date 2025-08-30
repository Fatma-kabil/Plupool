// select_role_repository.dart
import '../entities/role.dart';


abstract class SelectRoleRepository {
Future<void> saveRole(Role role);
Future<Role?> getSavedRole();
}