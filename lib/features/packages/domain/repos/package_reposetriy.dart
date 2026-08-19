import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
import 'package:plupool/features/packages/data/models/update_package_request.dart';
import 'package:plupool/features/packages/domain/entities/package_progress_entity.dart';

import '../entities/package_entity.dart';
import '../entities/packages_response_entity.dart';

abstract class PackagesRepository {
  Future<PackagesResponseEntity> getPackages({
    String? status,
    String? duration,
    String? search,
  });

  Future<PackageEntity> getPackageDetails(int id);

  Future<PackageProgressEntity> increaseProgress({
    required int packageId,
    required int bookingId,
  });

  Future<PackageProgressEntity> decreaseProgress({
    required int packageId,
    required int bookingId,
  });

  Future<Either<Failure, Unit>> createPackage(
  CreatePackageRequest request,
);

Future<Either<Failure, Unit>> updatePackage({
  required int packageId,
  required UpdatePackageRequest request,
});
}