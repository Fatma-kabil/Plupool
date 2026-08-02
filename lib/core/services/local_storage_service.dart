import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveNotificationRegistrationId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('notification_registration_id', id);
  }

  static Future<int?> getNotificationRegistrationId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('notification_registration_id');
  }

  static Future<void> removeNotificationRegistrationId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('notification_registration_id');
  }
}