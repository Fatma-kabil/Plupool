import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

import '../entities/packages_response_entity.dart';

class GetPackagesUseCase {
  final PackagesRepository repo;

  GetPackagesUseCase(this.repo);

  Future<PackagesResponseEntity> call({
    String? status,
    String? duration,
    String? search,
  }) {
    return repo.getPackages(
      status: status,
      duration: duration,
      search: search,
    );
  }
}