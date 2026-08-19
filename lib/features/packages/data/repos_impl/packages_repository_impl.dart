import 'package:dartz/dartz.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/packages/data/models/create_package_request.dart';
import 'package:plupool/features/packages/data/models/update_package_request.dart';
import 'package:plupool/features/packages/data/remote%20datasource/packages_remote_ds.dart';
import 'package:plupool/features/packages/domain/entities/package_progress_entity.dart';
import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

import '../../domain/entities/package_entity.dart';
import '../../domain/entities/packages_response_entity.dart';
import '../../domain/entities/packages_stats_entity.dart';

class PackagesRepositoryImpl implements PackagesRepository {
  final PackagesRemoteDataSource remote;

  PackagesRepositoryImpl(this.remote);

  @override
  Future<PackagesResponseEntity> getPackages({
    String? status,
    String? duration,
    String? search,
  }) async {
    final res = await remote.getPackages(
      status: status,
      duration: duration,
      search: search,
    );

    return PackagesResponseEntity(
      total: res.total,
      filteredCount: res.filteredCount,
      limit: res.limit,
      returned: res.returned,
      stats: PackagesStatsEntity(
        inProgress: res.stats.inProgress,
        completed: res.stats.completed,
        scheduled: res.stats.scheduled,
        pending: res.stats.pending,
      ),
      packages: res.packages,
    );
  }

  @override
  Future<PackageEntity> getPackageDetails(int id) {
    return remote.getPackage(id);
  }

  Future<PackageProgressEntity> increaseProgress({
    required int packageId,
    required int bookingId,
  }) async {
    return await remote.increaseProgress(
      packageId: packageId,
      bookingId: bookingId,
    );
  }

  @override
  Future<PackageProgressEntity> decreaseProgress({
    required int packageId,
    required int bookingId,
  }) async {
    return await remote.decreaseProgress(
      packageId: packageId,
      bookingId: bookingId,
    );
  }

  @override
  Future<Either<Failure, Unit>> createPackage(
    CreatePackageRequest request,
  ) async {
    try {
      await remote.createPackage(request);
      return const Right(unit);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
  @override
Future<Either<Failure, Unit>> updatePackage({
  required int packageId,
  required UpdatePackageRequest request,
}) async {
  try {
    await remote.updatePackage(
      packageId: packageId,
      request: request,
    );

    return const Right(unit);
  } catch (e) {
    return Left(mapDioError(e));
  }
}
}
