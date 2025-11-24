import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser(String token);
}
