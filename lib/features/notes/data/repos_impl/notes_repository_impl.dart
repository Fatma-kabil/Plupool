import 'package:plupool/features/notes/domain/repos/notes_repo.dart';

import '../../domain/entities/notes_response_entity.dart';

import '../data_sources/notes_remote_data_source.dart';
import '../models/note_model.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesRemoteDataSource remoteDataSource;

  NotesRepositoryImpl(this.remoteDataSource);

  @override
  Future<NotesResponseEntity> getNotes(
    int userId,
  ) {
    return remoteDataSource.getNotes(userId);
  }

  @override
  Future<void> addNote({
    required int userId,
    required dynamic model,
  }) {
    return remoteDataSource.addNote(
      userId: userId,
      model: model as AddNoteModel,
    );
  }

  @override
  Future<void> updateNote({
    required int userId,
    required int noteId,
    required dynamic model,
  }) {
    return remoteDataSource.updateNote(
      userId: userId,
      noteId: noteId,
      model: model as UpdateNoteModel,
    );
  }

  @override
  Future<void> deleteNote({
    required int userId,
    required int noteId,
  }) {
    return remoteDataSource.deleteNote(
      userId: userId,
      noteId: noteId,
    );
  }

  @override
  Future<void> addFilesToNote({
    required int userId,
    required int noteId,
    required dynamic model,
  }) {
    return remoteDataSource.addFilesToNote(
      userId: userId,
      noteId: noteId,
      model: model as AddNoteFilesModel,
    );
  }

  @override
  Future<void> deleteNoteFile({
    required int userId,
    required int noteId,
    required int fileId,
  }) {
    return remoteDataSource.deleteNoteFile(
      userId: userId,
      noteId: noteId,
      fileId: fileId,
    );
  }
}