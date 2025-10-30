// lib/core/network/endpoints.dart

class Endpoints {
  /// 🧠 رابط الباك إند المحلي (FastAPI)
  static const String baseUrl = 'http://192.168.43.149:8000/api/v1/auth';

  // 🔹 إنشاء الحساب حسب الدور
  static const String signupTechnician = '$baseUrl/signup/technician';
  static const String signupPoolOwner = '$baseUrl/signup/pool-owner';
  static const String signupCompany = '$baseUrl/signup/company';
  static const String sendOtp = '$baseUrl/send-otp';
 static const String verifyOtp = '$baseUrl/verify-otp';
}
