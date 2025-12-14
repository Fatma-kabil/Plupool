import 'package:equatable/equatable.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ================= Fetch User =================
class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserEntity user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object?> get props => [message];
}

/// ================= Update User =================
class UpdateUserLoading extends UserState {}

class UpdateUserSuccess extends UserState {
  final UserEntity user;

  UpdateUserSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class UpdateUserError extends UserState {
  final String message;

  UpdateUserError(this.message);

  @override
  List<Object?> get props => [message];
}

/// ================= Delete User =================
class DeleteUserLoading extends UserState {}

class DeleteUserSuccess extends UserState {}

class DeleteUserError extends UserState {
  final String message;

  DeleteUserError(this.message);

  @override
  List<Object?> get props => [message];
}
