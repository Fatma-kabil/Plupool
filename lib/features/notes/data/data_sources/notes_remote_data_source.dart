
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

import '../models/note_model.dart';
import '../models/notes_response_model.dart';

abstract class NotesRemoteDataSource {
  Future<NotesResponseModel> getNotes(int userId);

  Future<void> addNote({
    required int userId,
    required AddNoteModel model,
  });

  Future<void> updateNote({
    required int userId,
    required int noteId,
    required UpdateNoteModel model,
  });

  Future<void> deleteNote({
    required int userId,
    required int noteId,
  });

  Future<void> addFilesToNote({
    required int userId,
    required int noteId,
    required AddNoteFilesModel model,
  });

  Future<void> deleteNoteFile({
    required int userId,
    required int noteId,
    required int fileId,
  });
}

class NotesRemoteDataSourceImpl
    implements NotesRemoteDataSource {
  final ApiService api;

  NotesRemoteDataSourceImpl(this.api);

  @override
  Future<NotesResponseModel> getNotes(
    int userId,
  ) async {
    final response = await api.get(
      '${Endpoints.users}/$userId/notes',
    );

    return NotesResponseModel.fromJson(response.data);
  }

  @override
  Future<void> addNote({
    required int userId,
    required AddNoteModel model,
  }) async {
    await api.post(
      '${Endpoints.users}/$userId/notes',
     data: await model.toFormData(),
      
    );
  }

  @override
  Future<void> updateNote({
    required int userId,
    required int noteId,
    required UpdateNoteModel model,
  }) async {
    await api.put(
      '${Endpoints.users}/$userId/notes/$noteId',
      data: await model.toFormData(),
    );
  }

  @override
  Future<void> deleteNote({
    required int userId,
    required int noteId,
  }) async {
    await api.delete(
      '${Endpoints.users}/$userId/notes/$noteId',
    );
  }

  @override
  Future<void> addFilesToNote({
    required int userId,
    required int noteId,
    required AddNoteFilesModel model,
  }) async {
    await api.post(
      '${Endpoints.users}/$userId/notes/$noteId/files',
      data: await model.toFormData(),
    );
  }

  @override
  Future<void> deleteNoteFile({
    required int userId,
    required int noteId,
    required int fileId,
  }) async {
    await api.delete(
      '${Endpoints.users}/$userId/notes/$noteId/files/$fileId',
    );
  }
}