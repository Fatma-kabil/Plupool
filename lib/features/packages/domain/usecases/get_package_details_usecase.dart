import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

import '../entities/package_entity.dart';

class GetPackageDetailsUseCase {
  final PackagesRepository repo;

  GetPackageDetailsUseCase(this.repo);

  Future<PackageEntity> call(int packageId) {
    return repo.getPackageDetails(packageId);
  }
}