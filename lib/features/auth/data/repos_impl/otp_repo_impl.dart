import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/data/datasources/otp_remote_data_source.dart';
import 'package:plupool/features/auth/data/models/send_otp_respnse_model.dart';
import 'package:plupool/features/auth/domain/repos/otp_repo.dart';

class OtpRepoImpl implements OtpRepository {
  final OtpRemoteDataSource remoteDataSource;

  OtpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SendOtpResponseModel>> sendOtp({
    required String phone,
    required String purpose,
  }) async {
    try {
      print('📡 [Repo] Sending OTP to $phone');
      print('🎯 Purpose: $purpose');

      final response = await remoteDataSource.sendOtp(
        phone: phone,
        purpose: purpose,
      );

      print('✅ [Repo] OTP sent successfully');

      return Right(response);
    } catch (e) {
      print('❌ [Repo] Error while sending OTP: $e');

      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp(
    String phone,
    String otpCode,
  ) async {
    try {
      final token = await remoteDataSource.verifyOtp(
        phone,
        otpCode,
      );

      return Right(token);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}