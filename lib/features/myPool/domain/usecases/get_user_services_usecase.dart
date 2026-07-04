import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';
import 'package:plupool/features/myPool/domain/repos/user_services_repoditory.dart';

class GetUserServicesUsecase {
  final UserServicesRepoditory repository;
  GetUserServicesUsecase(this.repository);
  Future<Either<Failure, List<UserServiceEntity>>> call({
    String? tab,
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) {
    return repository.getUserServices(
      tab: tab,
      status: status,
      search: search,
      skip: skip,
      limit: limit,
    );
  }
}
