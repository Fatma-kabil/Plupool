import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/home/data/models/add_support_message_model.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';

class SupportRemoteDataSource {
  final ApiService api;

  SupportRemoteDataSource(this.api);

  Future<void> addSupportMessage(
    AddSupportMessageParams params,
  ) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final model = AddSupportMessageModel.fromParams(params);

    await api.post(
      "${Endpoints.baseUrl}/pool-owner/support/messages",
      data: await model.toFormData(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}