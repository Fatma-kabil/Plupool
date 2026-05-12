import '../entities/notes_response_entity.dart';

abstract class NotesRepository {
  Future<NotesResponseEntity> getNotes(int userId);

  Future<void> addNote({
    required int userId,
    required dynamic model,
  });

  Future<void> updateNote({
    required int userId,
    required int noteId,
    required dynamic model,
  });

  Future<void> deleteNote({
    required int userId,
    required int noteId,
  });

  Future<void> addFilesToNote({
    required int userId,
    required int noteId,
    required dynamic model,
  });

  Future<void> deleteNoteFile({
    required int userId,
    required int noteId,
    required int fileId,
  });
}