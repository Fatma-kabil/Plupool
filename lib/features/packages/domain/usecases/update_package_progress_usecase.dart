import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';



class UpdatePackageProgressUseCase {
  final PackagesRepository repo;

  UpdatePackageProgressUseCase(this.repo);

  Future<void> call({
    required int packageId,
    required int bookingId,
    String? status,
    DateTime? nextDate,
    String? notes,
  }) {
    return repo.updateProgress(
      packageId: packageId,
      bookingId: bookingId,
      status: status,
      nextDate: nextDate,
      notes: notes,
    );
  }
}