import 'package:dartz/dartz.dart';

import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/packages/data/models/update_package_request.dart';
import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

class UpdatePackageUseCase {
  final PackagesRepository repository;

  UpdatePackageUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int packageId,
    required UpdatePackageRequest request,
  }) {
    return repository.updatePackage(
      packageId: packageId,
      request: request,
    );
  }
}