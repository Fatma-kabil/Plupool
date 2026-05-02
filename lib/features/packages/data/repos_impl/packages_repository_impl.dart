import 'package:plupool/features/packages/data/remote%20datasource/packages_remote_ds.dart';
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
      ),
      packages: res.packages,
    );
  }

  @override
  Future<PackageEntity> getPackageDetails(int id) {
    return remote.getPackage(id);
  }

  @override
  Future<void> updateProgress({
    required int packageId,
    required int bookingId,
    String? status,
    DateTime? nextDate,
    String? notes,
  }) {
    return remote.updateProgress(
      packageId: packageId,
      bookingId: bookingId,
      status: status,
      nextDate: nextDate,
      notes: notes,
    );
  }

  @override
  Future<void> addVisit({
    required int packageId,
    required int userId,
    required String date,
    required String time,
    String? notes,
  }) {
    return remote.addVisit(
      packageId: packageId,
      userId: userId,
      date: date,
      time: time,
      notes: notes,
    );
  }
}