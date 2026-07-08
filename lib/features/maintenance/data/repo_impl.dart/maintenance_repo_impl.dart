import 'package:plupool/features/maintenance/data/remote_data_source.dart/maintenance_remote_data_source.dart';
import 'package:plupool/features/maintenance/domain/repos/maintenance_repository.dart';

import '../../domain/entities/maintenance_service_entity.dart';


class MaintenanceRepositoryImpl implements MaintenanceRepository {
  final MaintenanceRemoteDataSource remoteDataSource;

  MaintenanceRepositoryImpl(this.remoteDataSource);

  @override
  Future<MaintenanceServiceEntity> getMaintenanceService() async {
    return await remoteDataSource.getMaintenanceService();
  }
}