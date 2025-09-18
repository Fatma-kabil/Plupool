class Validators {
  // ✅ دوال مساعدة للـ Null & Trim
  static bool _isNullOrEmpty(String? v) =>
      v == null || v.trim().isEmpty;

  // ✅ حقل مطلوب
  static String? required(String? v, {String fieldName = 'الحقل'}) {
    if (_isNullOrEmpty(v)) return '$fieldName مطلوب';
    return null;
  }

  // ✅ الاسم
  static String? name(String? v, {int minLength = 3, int maxLength = 50}) {
    if (_isNullOrEmpty(v)) return 'الاسم مطلوب';
    final value = v!.trim();
    if (value.length < minLength) return 'الاسم قصير جدًا (يجب أن يكون $minLength أحرف على الأقل)';
    if (value.length > maxLength) return 'الاسم طويل جدًا (بحد أقصى $maxLength حرف)';
    return null;
  }

  // ✅ رقم الموبايل (يدعم أرقام فقط بطول 8-15)
  static String? phone(String? v, {int min = 8, int max = 15}) {
    if (_isNullOrEmpty(v)) return 'رقم الموبايل مطلوب';
    final digits = v!.replaceAll(RegExp(r'\D'), '');
    if (digits.length < min || digits.length > max) {
      return 'رقم الموبايل غير صحيح (يجب أن يكون بين $min و $max رقم)';
    }
    return null;
  }

  // ✅ البريد الإلكتروني
  static String? email(String? v) {
    if (_isNullOrEmpty(v)) return 'البريد الإلكتروني مطلوب';
    final pattern = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!pattern.hasMatch(v!.trim())) return 'البريد الإلكتروني غير صحيح';
    return null;
  }

  // ✅ كلمة المرور
  static String? password(String? v,
      {int minLength = 6, bool requireNumber = true, bool requireUpper = false}) {
    if (_isNullOrEmpty(v)) return 'كلمة المرور مطلوبة';
    final value = v!;
    if (value.length < minLength) {
      return 'كلمة المرور يجب ألا تقل عن $minLength أحرف';
    }
    if (requireNumber && !RegExp(r'[0-9]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (requireUpper && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    return null;
  }

  // ✅ تأكيد كلمة المرور
  static String? confirmPassword(String? v, String? original) {
    if (_isNullOrEmpty(v)) return 'تأكيد كلمة المرور مطلوب';
    if (v != original) return 'كلمة المرور غير متطابقة';
    return null;
  }

 static String? emailOrPhoneValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'هذا الحقل مطلوب';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final phoneRegex = RegExp(r'^(?:\+?\d{1,3})?[0-9]{8,14}$');

  if (!emailRegex.hasMatch(value.trim()) &&
      !phoneRegex.hasMatch(value.trim())) {
    return 'أدخل بريد إلكتروني صالح أو رقم هاتف صحيح';
  }

  return null;
}

}
