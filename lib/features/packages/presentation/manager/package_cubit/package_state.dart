

import 'package:plupool/features/packages/domain/entities/package_entity.dart';
import 'package:plupool/features/packages/domain/entities/packages_response_entity.dart';

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

// details
class PackageDetailsLoading extends PackagesState {}

class PackageDetailsSuccess extends PackagesState {
  final PackageEntity package;

  PackageDetailsSuccess(this.package);
}

class PackageDetailsError extends PackagesState {
  final String message;

  PackageDetailsError(this.message);
}

// actions
class PackagesActionLoading extends PackagesState {}

class PackagesActionSuccess extends PackagesState {}

class PackagesActionError extends PackagesState {
  final String message;

  PackagesActionError(this.message);
}