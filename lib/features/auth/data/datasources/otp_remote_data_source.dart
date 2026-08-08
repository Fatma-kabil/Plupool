import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/core/security/proof_of_work_solver.dart';
import 'package:plupool/features/auth/data/models/otp_challenge_model.dart';
import 'package:plupool/features/auth/data/models/send_otp_respnse_model.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

abstract class OtpRemoteDataSource {
  Future<SendOtpResponseModel> sendOtp(String phone);
  Future<String> verifyOtp(String phone, String otpCode);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final ApiService apiService;
  final storage = const FlutterSecureStorage();
  final AuthCubit authCubit; // 🔹 instance من AuthCubit

  OtpRemoteDataSourceImpl(this.apiService, this.authCubit);

  @override
  Future<SendOtpResponseModel> sendOtp(String phone) async {
    // 1. اطلب الـ Challenge
    final response = await apiService.get(Endpoints.otpChallenge);

    // 2. حول الـ Response إلى Model
    final challengeData = OtpChallengeModel.fromJson(response.data['data']);

    // 3. حل الـ Challenge
    final nonce = await ProofOfWorkSolver.solveAkedlyChallenge(
      challenge: challengeData.challenge,
      difficulty: challengeData.difficulty,
    );

    print("Challenge Token: ${challengeData.challengeToken}");
    print("Nonce: $nonce");
    final responseSendOtp = await apiService.post(
      Endpoints.sendOtp,
      data: {
        'phone': phone,
        'powSolution': {
          'challengeToken': challengeData.challengeToken,
          'nonce': nonce,
        },
      },
    );

    return SendOtpResponseModel.fromJson(responseSendOtp.data);
  }

  @override
  Future<String> verifyOtp(String phone, String otpCode) async {
    print(
      '📤 Sending verify OTP request: '
      'data=${{'phone': phone, 'otp_code': otpCode}}',
    );

    final response = await apiService.post(
      Endpoints.verifyOtp,
      data: {'phone': phone, 'otp_code': otpCode},
    );

    print('📥 Server response status: ${response.statusCode}');

    final accessToken = response.data['access_token'];
    final refreshToken = response.data['refresh_token'];

    if (accessToken == null || refreshToken == null) {
      throw Exception('Access token or refresh token is missing');
    }

    // حفظ Access Token
    await storage.write(key: 'token', value: accessToken);

    // حفظ Refresh Token
    await storage.write(key: 'refresh_token', value: refreshToken);

    // تحديث AuthCubit
    authCubit.login(accessToken);

    return accessToken;
  }
}
