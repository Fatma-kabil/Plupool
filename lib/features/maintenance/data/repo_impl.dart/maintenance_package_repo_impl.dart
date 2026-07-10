import 'package:plupool/features/maintenance/data/remote_data_source.dart/maintenance_remote_data_souce.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_package_entity.dart';
import 'package:plupool/features/maintenance/domain/repos/maintenance_package_repo.dart';

class MaintenancePackageRepoImpl implements MaintenancePackageRepository {
  final MaintenancePackageRemoteDataSource remoteDataSource;

  MaintenancePackageRepoImpl(this.remoteDataSource);
  @override
  Future<List<MaintenancePackageEntity>> getPackages({String? duration}) {
    return remoteDataSource.getPackages(duration: duration);
  }
}
