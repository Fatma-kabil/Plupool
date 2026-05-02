import 'package:plupool/features/packages/domain/repos/package_reposetriy.dart';



class AddPackageVisitUseCase {
  final PackagesRepository repo;

  AddPackageVisitUseCase(this.repo);

  Future<void> call({
    required int packageId,
    required int userId,
    required String date,
    required String time,
    String? notes,
  }) {
    return repo.addVisit(
      packageId: packageId,
      userId: userId,
      date: date,
      time: time,
      notes: notes,
    );
  }
}