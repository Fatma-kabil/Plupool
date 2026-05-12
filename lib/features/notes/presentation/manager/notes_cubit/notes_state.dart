import 'package:plupool/features/notes/domain/entities/note_entity.dart';

abstract class NotesState {}

/// ================= INITIAL =================

class NotesInitial extends NotesState {}

/// ================= GET NOTES =================

class GetNotesLoading extends NotesState {}

class GetNotesSuccess extends NotesState {
  final List<NoteEntity> notes;

  GetNotesSuccess(this.notes);
}

class GetNotesError extends NotesState {
  final String message;

  GetNotesError(this.message);
}

/// ================= ADD NOTE =================

class AddNoteLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class AddNoteError extends NotesState {
  final String message;

  AddNoteError(this.message);
}

/// ================= UPDATE NOTE =================

class UpdateNoteLoading extends NotesState {}

class UpdateNoteSuccess extends NotesState {}

class UpdateNoteError extends NotesState {
  final String message;

  UpdateNoteError(this.message);
}

/// ================= DELETE NOTE =================

class DeleteNoteLoading extends NotesState {}

class DeleteNoteSuccess extends NotesState {}

class DeleteNoteError extends NotesState {
  final String message;

  DeleteNoteError(this.message);
}

/// ================= ADD NOTE FILES =================

class AddNoteFilesLoading extends NotesState {}

class AddNoteFilesSuccess extends NotesState {}

class AddNoteFilesError extends NotesState {
  final String message;

  AddNoteFilesError(this.message);
}

/// ================= DELETE NOTE FILE =================

class DeleteNoteFileLoading extends NotesState {}

class DeleteNoteFileSuccess extends NotesState {}

class DeleteNoteFileError extends NotesState {
  final String message;

  DeleteNoteFileError(this.message);
}