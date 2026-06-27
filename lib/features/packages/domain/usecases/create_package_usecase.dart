import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

class CreatePackageUseCase {
  final PackagesRepository repository;

  CreatePackageUseCase(this.repository);

  Future<Either<Failure, Unit>> call(
    CreatePackageRequest request,
  ) {
    return repository.createPackage(request);
  }
}