part of 'select_role_cubit.dart';

abstract class SelectRoleState {}

class SelectRoleInitial extends SelectRoleState {}

class SaveRoleLoading extends SelectRoleState {}
class SaveRoleSuccess extends SelectRoleState {}
class SaveRoleError extends SelectRoleState {
  final String message;
  SaveRoleError(this.message);
}

class GetRoleLoading extends SelectRoleState {}
class GetRoleSuccess extends SelectRoleState {
  final String roleName;
  GetRoleSuccess(this.roleName);
}
class GetRoleEmpty extends SelectRoleState {}
class GetRoleError extends SelectRoleState {
  final String message;
  GetRoleError(this.message);
}
