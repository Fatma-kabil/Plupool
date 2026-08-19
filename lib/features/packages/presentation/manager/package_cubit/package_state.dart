import 'package:plupool/features/packages/domain/entities/package_entity.dart';
import 'package:plupool/features/packages/domain/entities/packages_response_entity.dart';
import 'package:plupool/features/packages/domain/entities/package_progress_entity.dart';

// =========================
// 📦 INITIAL / LIST
// =========================

abstract class PackagesState {}

class PackagesInitial extends PackagesState {}

class PackagesLoading extends PackagesState {}

class PackagesSuccess extends PackagesState {
  final PackagesResponseEntity response;

  PackagesSuccess(this.response);
}

class PackagesError extends PackagesState {
  final String message;

  PackagesError(this.message);
}

// =========================
// 📄 DETAILS
// =========================

class PackageDetailsLoading extends PackagesState {}

class PackageDetailsSuccess extends PackagesState {
  final PackageEntity package;

  PackageDetailsSuccess(this.package);
}

class PackageDetailsError extends PackagesState {
  final String message;

  PackageDetailsError(this.message);
}

// =========================
// ⚡ ACTIONS - UPDATE / VISIT
// =========================

class PackagesActionLoading extends PackagesState {}

class PackagesActionSuccess extends PackagesState {
  final PackageProgressEntity? progress;

  PackagesActionSuccess({
    this.progress,
  });
}

class PackagesActionError extends PackagesState {
  final String message;

  PackagesActionError(this.message);
}

// =========================
// ➕ ADD PACKAGE
// =========================

class PackageAddLoading extends PackagesState {}

class PackageAddSuccess extends PackagesState {}

class PackageAddError extends PackagesState {
  final String message;

  PackageAddError(this.message);
}
class UpdatePackageLoading extends PackagesState {}

class UpdatePackageSuccess extends PackagesState {}

class UpdatePackageError extends PackagesState {
  final String message;

  UpdatePackageError(this.message);
}