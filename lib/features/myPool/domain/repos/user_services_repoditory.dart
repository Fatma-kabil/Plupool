 import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';

abstract class UserServicesRepoditory {
  Future<Either<Failure, List<UserServiceEntity>>> getUserServices({
  String? tab,
  String? status,
  String? search,
  int? skip,
  int? limit,
});
}