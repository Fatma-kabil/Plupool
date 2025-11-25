import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';
import 'package:plupool/features/profile/data/remote_data_source.dart/get_user_remote_data_source.dart';
import 'package:plupool/features/profile/domain/repos/user_repo.dart';
import '../../domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser(String token) async {
    try {
      final userModel = await remoteDataSource.getCurrentUser(token);
      return Right(userModel);
    } on DioError catch (e) {
      return Left(mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure( e.toString()));
    }
  }

    Future<Either<Failure, UserEntity>> updateUser(
      int id, String token, UpdateUserModel data) async {

    try {
      final updatedUser = await remoteDataSource.updateUser(id, token, data);
      return Right(updatedUser); 
    } on DioError catch (e) {
      return Left(mapDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
