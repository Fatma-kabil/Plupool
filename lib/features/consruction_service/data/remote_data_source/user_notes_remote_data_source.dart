import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/consruction_service/data/models/user_note_model.dart';

class UserNotesRemoteDataSource {
   final ApiService api;

  UserNotesRemoteDataSource(this.api);

  
  Future <List<UserNotesModel>> getNotes(
    
  ) async {
    final response = await api.get(
      '${Endpoints.baseUrl}/pool-owner/notes',

      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return (response.data as List)
        .map((e) => UserNotesModel.fromJson(e))
        .toList();
  }
}