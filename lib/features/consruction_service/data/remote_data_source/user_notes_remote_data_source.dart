import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/consruction_service/data/models/user_note_model.dart';

class UserNotesRemoteDataSource {
  final ApiService api;

  UserNotesRemoteDataSource(this.api);

  Future<List<UserNotesModel>> getNotes() async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      '${Endpoints.baseUrl}/pool-owner/notes',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return (response.data as List)
        .map((e) => UserNotesModel.fromJson(e))
        .toList();
  }

  Future<UserNotesModel> addNote(AddNoteModel model) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.post(
      '${Endpoints.baseUrl}/pool-owner/notes',
      options: Options(
        contentType: 'multipart/form-data',
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: await model.toFormData(),
    );

    print(response.data);

    return UserNotesModel.fromJson(response.data);
  }
}