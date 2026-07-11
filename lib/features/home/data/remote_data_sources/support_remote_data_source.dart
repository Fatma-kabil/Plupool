import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/home/data/models/add_support_message_model.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';

class SupportRemoteDataSource {
  final ApiService api;

  SupportRemoteDataSource(this.api);

  Future<void> addSupportMessage(AddSupportMessageParams params) async {
    final model = AddSupportMessageModel.fromParams(params);

    await api.post(
      "${Endpoints.baseUrl}/pool-owner/support/messages",
      data: await model.toFormData(),
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );
  }
}
