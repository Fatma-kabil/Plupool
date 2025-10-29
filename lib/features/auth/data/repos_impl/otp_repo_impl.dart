import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/auth/data/datasources/otp_remote_data_source.dart';
import 'package:plupool/features/auth/domain/repos/otp_repo.dart';

class OtpRepoImpl implements OtpRepository {
  final OtpRemoteDataSource remoteDataSource;

  OtpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> sendOtp(String phone) async {
    try {
      await remoteDataSource.sendOtp(phone);
      return const Right(null);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtp(String phone, String otpCode) async {
    try {
      final token = await remoteDataSource.verifyOtp(phone, otpCode);
      return Right(token);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
