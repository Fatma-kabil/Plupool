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
    final response = await apiService.post(
      Endpoints.verifyOtp,
      data: {'phone': phone, 'otp_code': otpCode},
    );
    return response.data['access_token'];
  }
}
