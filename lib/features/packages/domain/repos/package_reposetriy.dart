import '../entities/package_entity.dart';
import '../entities/packages_response_entity.dart';

abstract class PackagesRepository {
  Future<PackagesResponseEntity> getPackages({
    String? status,
    String? duration,
    String? search,
  });

  Future<PackageEntity> getPackageDetails(int id);

  Future<void> updateProgress({
    required int packageId,
    required int bookingId,
    String? status,
    DateTime? nextDate,
    String? notes,
  });

  Future<void> addVisit({
    required int packageId,
    required int userId,
    required String date,
    required String time,
    String? notes,
  });
}