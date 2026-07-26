import 'package:plupool/features/services/domain/entities/company_service_entity.dart';

abstract class CompanyServiceRepository {
  Future<List<CompanyServiceEntity>> getMaintenanceServices({
    String? status,
    String? search,
    int? skip,
    int? limit,
  });

  Future<List<CompanyServiceEntity>> getServicesPackages({
    String? status,
    String? search,
    int? skip,
    int? limit,
  });
}

