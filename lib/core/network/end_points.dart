// lib/core/network/endpoints.dart

class Endpoints {
  /// 🧠 رابط الباك إند المحلي (FastAPI)
  static const String baseUrl = 'http://192.168.43.149:8000/api/v1';


  // 🔹 إنشاء الحساب حسب الدور
static const String sendOtp = '$baseUrl/auth/send-otp';
static const String verifyOtp = '$baseUrl/auth/verify-otp';
static const String signupTechnician = '$baseUrl/auth/signup/technician';
static const String signupPoolOwner = '$baseUrl/auth/signup/pool-owner';
static const String signupCompany = '$baseUrl/auth/signup/company';
static const String getCurrentUser = '$baseUrl/users/me';
static const String updateUser = '$baseUrl/users';
  // ... روابط نقاط نهاية أخرى
} 
