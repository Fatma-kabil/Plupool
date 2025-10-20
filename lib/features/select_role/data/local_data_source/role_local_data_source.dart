import 'package:shared_preferences/shared_preferences.dart';

class RoleLocalDataSource {
  static const _roleKey = 'user_role';

  Future<void> saveRole(String roleName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, roleName);
  }

  Future<String?> getSavedRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }
}
