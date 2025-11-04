import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
abstract class OtpRemoteDataSource {
  Future<void> sendOtp(String phone);
  Future<String> verifyOtp(String phone, String otpCode);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final ApiService apiService;

  OtpRemoteDataSourceImpl(this.apiService);

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
print('📥 Server response data: ${response.data}');

  return response.data['access_token'];
}

}
