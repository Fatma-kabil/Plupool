import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';

abstract class OtpRepository {
  Future<Either<Failure, void>> sendOtp(String phone);
  Future<Either<Failure, String>> verifyOtp(String phone, String otpCode);
}
