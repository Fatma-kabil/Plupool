// role.dart

/// تعريف Enum للأدوار في التطبيق
/// - admin: مدير النظام
/// - client: المستخدم العادي (العميل)
/// - technician: الفني
enum Role { admin, client, technician }

/// Extension على enum Role
extension RoleX on Role {
  /// Getter بيرجع النص المناسب لكل Role
  String get shortName {
    switch (this) {
      case Role.admin:
        return 'admin';
      case Role.client:
        return 'client';
      case Role.technician:
        return 'technician';
    }
  }
}

///  لتحويل النص (String) إلى Enum Role
Role? roleFromString(String? value) {
  if (value == null) return null;
  try {
    // نبحث في كل القيم (Role.values) ونشوف أي Role له نفس shortName
    return Role.values.firstWhere((r) => r.shortName == value);
  } catch (_) {
    // في حالة النص مش مطابق لأي قيمة → null
    return null;
  }
}
