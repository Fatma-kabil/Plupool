import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/tasks/data/remote_data_sources/technician_services_remote_datasource.dart';
import 'package:plupool/features/tasks/domain/entities/technician_services_entity.dart';
import 'package:plupool/features/tasks/domain/repos/technician_services_repo.dart';

class TechnicianServicesRepoImpl implements TechnicianServicesRepo {
  final TechnicianServicesRemoteDataSource remoteDataSource;

  TechnicianServicesRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, TechnicianServicesEntity>>
      getTechnicianServices({
    required int clientId,
    String? status,
  }) async {
    try {
      final result = await remoteDataSource.getTechnicianServices(
        clientId: clientId,
        status: status,
      );

      return right(result);
    } on Exception catch (e) {
      return left(mapDioError(e));
    }
  }
}