import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

abstract class OtpRemoteDataSource {
  Future<void> sendOtp(String phone);
  Future<String> verifyOtp(String phone, String otpCode);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final ApiService apiService;
  final storage = const FlutterSecureStorage();
    final AuthCubit authCubit; // 🔹 instance من AuthCubit

  OtpRemoteDataSourceImpl(this.apiService, this.authCubit);

  @override
  Future<void> sendOtp(String phone) async {
    await apiService.post(
      Endpoints.sendOtp,
      data: {'phone': phone},
    );
  }

  @override
  Future<String> verifyOtp(String phone, String otpCode) async {
    print('📤 Sending verify OTP request: data=${{'phone': phone, 'otp_code': otpCode}}');

    final response = await apiService.post(
      Endpoints.verifyOtp,
      data: {'phone': phone, 'otp_code': otpCode},
    );

    print('📥 Server response: ${response.data}');
    print('📥 Server response status code: ${response.statusCode}');

    final accessToken = response.data['access_token'];

    // ✅ خزّن التوكن هنا
    await storage.write(key: 'token', value: accessToken);
    
// 🔹 حدث AuthCubit لو موجود
authCubit.login(accessToken); // authCubit يتم تمريره من مكانه أو Injected

    return accessToken;
  }
}
