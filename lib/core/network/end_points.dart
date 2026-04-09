// lib/core/network/endpoints.dart

class Endpoints {
  /// 🧠 رابط الباك إند المحلي (FastAPI)
  static const String baseUrl = 'http://72.60.177.42/api/v1';


  // 🔹 إنشاء الحساب حسب الدور
static const String sendOtp = '$baseUrl/auth/send-otp';
static const String verifyOtp = '$baseUrl/auth/verify-otp';
static const String signupTechnician = '$baseUrl/auth/signup/technician';
static const String signupPoolOwner = '$baseUrl/auth/signup/pool-owner';
static const String signupCompany = '$baseUrl/auth/signup/company';
static const String getCurrentUser = '$baseUrl/users/me';
static const String updateUser = '$baseUrl/users';
static const String contact = '$baseUrl/contact';
static const String notifications = '$baseUrl/notifications';
static const String products = '$baseUrl/admin/products/';
static const String adminStatistics = '$baseUrl/admin/dashboard/statistics';
// static const String productsOffer = '$baseUrl/admin/products/{product_id}/offer';
  // ... روابط نقاط نهاية أخرى
} 
