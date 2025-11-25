import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser(String token);
  Future<Either<Failure, UserEntity>> updateUser(
    int id,
    String token,
    UpdateUserModel data,
  );
   Future<Either<Failure, void>> deleteUser(int id, String token);
}
