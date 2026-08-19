import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';

import '../entities/package_progress_entity.dart';

class DecreasePackageProgress {
  final PackagesRepository repository;

  DecreasePackageProgress({
    required this.repository,
  });

  Future<PackageProgressEntity> call({
    required int packageId,
    required int bookingId,
  }) async {
    return await repository.decreaseProgress(
      packageId: packageId,
      bookingId: bookingId,
    );
  }
}