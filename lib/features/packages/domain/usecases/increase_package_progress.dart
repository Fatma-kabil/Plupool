import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

import '../entities/package_progress_entity.dart';

class IncreasePackageProgress {
  final PackagesRepository repository;

  IncreasePackageProgress({
    required this.repository,
  });

  Future<PackageProgressEntity> call({
    required int packageId,
    required int bookingId,
  }) async {
    return await repository.increaseProgress(
      packageId: packageId,
      bookingId: bookingId,
    );
  }
}