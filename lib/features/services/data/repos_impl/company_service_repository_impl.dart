import 'package:plupool/features/services/data/remote_data_source/company_service_remote_data_source.dart';
import 'package:plupool/features/services/domain/repos/company_service_repository.dart';

import '../../domain/entities/company_service_entity.dart';

class CompanyServiceRepositoryImpl
    implements CompanyServiceRepository {
  final CompanyServiceRemoteDataSource remoteDataSource;

  CompanyServiceRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CompanyServiceEntity>> getMaintenanceServices({
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    return await remoteDataSource.getMaintenanceServices(
      status: status,
      search: search,
      skip: skip,
      limit: limit,
    );
  }

  @override
  Future<List<CompanyServiceEntity>> getServicesPackages({
    String? status,
    String? search,
    int? skip,
    int? limit,
  }) async {
    return await remoteDataSource.getServicesPackages(
      status: status,
      search: search,
      skip: skip,
      limit: limit,
    );
  }
}