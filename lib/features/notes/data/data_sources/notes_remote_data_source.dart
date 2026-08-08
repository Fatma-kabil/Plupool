import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

import '../models/note_model.dart';
import '../models/notes_response_model.dart';

abstract class NotesRemoteDataSource {
  Future<NotesResponseModel> getNotes(int userId);

  Future addNote({
    required int userId,
    required AddNoteModel model,
  });

  Future updateNote({
    required int userId,
    required int noteId,
    required UpdateNoteModel model,
  });

  Future deleteNote({
    required int userId,
    required int noteId,
  });

  Future addFilesToNote({
    required int userId,
    required int noteId,
    required AddNoteFilesModel model,
  });

  Future deleteNoteFile({
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
  Future<NotesResponseModel> getNotes(int userId) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      '${Endpoints.users}/$userId/notes',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return NotesResponseModel.fromJson(response.data);
  }

  @override
  Future addNote({
    required int userId,
    required AddNoteModel model,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.post(
      '${Endpoints.users}/$userId/notes',
      data: await model.toFormData(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future updateNote({
    required int userId,
    required int noteId,
    required UpdateNoteModel model,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.put(
      '${Endpoints.users}/$userId/notes/$noteId',
      data: await model.toFormData(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future deleteNote({
    required int userId,
    required int noteId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.delete(
      '${Endpoints.users}/$userId/notes/$noteId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future addFilesToNote({
    required int userId,
    required int noteId,
    required AddNoteFilesModel model,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.post(
      '${Endpoints.users}/$userId/notes/$noteId/files',
      data: await model.toFormData(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future deleteNoteFile({
    required int userId,
    required int noteId,
    required int fileId,
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    await api.delete(
      '${Endpoints.users}/$userId/notes/$noteId/files/$fileId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}