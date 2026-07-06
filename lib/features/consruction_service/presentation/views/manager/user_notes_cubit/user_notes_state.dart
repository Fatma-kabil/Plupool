import 'package:plupool/features/consruction_service/domain/entities/user_notes_entity.dart';

abstract class UserNotesState {}

class UserNotesInitial extends UserNotesState {}

class UserNotesLoading extends UserNotesState {}

class UserNotesAdding extends UserNotesState {}

class UserNotesSuccess extends UserNotesState {
  final List<UserNotesEntity> userNotes;

  UserNotesSuccess(this.userNotes);
}

class UserNotesAddedSuccessfully extends UserNotesState {
  final List<UserNotesEntity> userNotes;

  UserNotesAddedSuccessfully(this.userNotes);
}

class UserNotesFailure extends UserNotesState {
  final String message;

  UserNotesFailure(this.message);
}