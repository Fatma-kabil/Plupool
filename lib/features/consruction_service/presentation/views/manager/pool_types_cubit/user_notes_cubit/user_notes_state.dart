

import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';

class UserNotesState {}

class UserNotesInitial extends UserNotesState {}

class UserNotesLoading extends UserNotesState {}

class UserNotesSuccess extends UserNotesState {
  final List<UserNotesEntity> userNotes;

  UserNotesSuccess(this.userNotes);
}

class UserNotesFailure extends UserNotesState {
  final String message;

  UserNotesFailure(this.message);
}