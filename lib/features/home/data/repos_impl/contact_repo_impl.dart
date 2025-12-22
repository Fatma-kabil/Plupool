import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/home/data/models/contact_request_model.dart';
import 'package:plupool/features/home/data/remote_data_sources/contact_ramote_data_source.dart';
import 'package:plupool/features/home/domain/entities/contact_request_entity.dart';
import 'package:plupool/features/home/domain/repos/contact_repo.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;

  ContactRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> sendContactMessage(
      ContactRequestEntity request) async {
    try {
      final model = ContactRequestModel(
        name: request.name,
        email: request.email,
        phone: request.phone,
        message: request.message,
      );

      final responseMessage =
          await remoteDataSource.sendContactMessage(model);

      return Right(responseMessage);
    } on DioError catch (e) {
      return Left(mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
