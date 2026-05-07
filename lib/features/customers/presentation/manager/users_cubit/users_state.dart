// users_state.dart

import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';

abstract class UsersState {}

/// =========================
/// INITIAL
/// =========================

class UsersInitial extends UsersState {}

/// =========================
/// GET USERS
/// =========================

class UsersLoading extends UsersState {}

class UsersSuccess extends UsersState {
  final List<UserEntity> users;

  UsersSuccess(this.users);
}

class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}

/// =========================
/// USER DETAILS
/// =========================

class UserDetailsLoading extends UsersState {}

class UserDetailsSuccess extends UsersState {
  final UserDetailsEntity user;

  UserDetailsSuccess(this.user);
}

class UserDetailsError extends UsersState {
  final String message;

  UserDetailsError(this.message);
}

/// =========================
/// ACTIONS
/// =========================

class UsersActionLoading extends UsersState {}

class UsersActionSuccess extends UsersState {}

class UsersActionError extends UsersState {
  final String message;

  UsersActionError(this.message);
}

/// =========================
/// DELETE
/// =========================

class UsersDeleting extends UsersState {}

class UsersDeleteSuccess extends UsersState {}

class UsersDeleteError extends UsersState {
  final String message;

  UsersDeleteError(this.message);
}
