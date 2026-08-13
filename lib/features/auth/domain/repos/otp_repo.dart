import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/data/models/send_otp_respnse_model.dart';

abstract class OtpRepository {
  Future<Either<Failure, SendOtpResponseModel>> sendOtp({
    required String phone,
    required String purpose,
  });

  Future<Either<Failure, String>> verifyOtp(
    String phone,
    String otpCode,
  );
}