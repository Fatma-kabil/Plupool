import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/data/remote_data_sources/support_remote_data_source.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';
import 'package:plupool/features/home/domain/repos/support_repo.dart';

class SupportRepoImpl implements SupportRepository {
  final SupportRemoteDataSource remoteDataSource;
  SupportRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addSupportMessage(
    AddSupportMessageParams params,
  ) async {
    try {
      await remoteDataSource.addSupportMessage(params);
      return const Right(null);
    } catch (e) {
      return Left(mapDioError(e.toString()));
    }
  }
}
