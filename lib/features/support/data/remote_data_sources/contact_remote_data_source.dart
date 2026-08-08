import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/reports/data/models/contact_message_model.dart';
import 'package:plupool/features/reports/data/models/contact_message_response_model.dart';
import 'package:dio/dio.dart';
class ContactRemoteDataSource  {
  final ApiService api;

  ContactRemoteDataSource(this.api);

  
  Future<ContactMessagesResponseModel> getMessages({
    String? type,
    String? status,
    String? senderRole,
    String? search,
    int? userId
  }) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');

    final response = await api.get(
      Endpoints.contactMessages,
      queryParams: {
        if (type != null) 'type': type,
        if (status != null) 'status': status,
        if (senderRole != null) 'sender_role': senderRole,
        if (search != null) 'search': search,
        if(userId !=null) 'userId':userId
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return ContactMessagesResponseModel.fromJson(response.data);
  }

 
  Future<ContactMessageModel> getMessageDetails(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response =
        await api.get('${Endpoints.contactMessages}/$id',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },));

    return ContactMessageModel.fromJson(response.data);
  }

 
  Future<void> deleteMessage(int id) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await api.delete('${Endpoints.contactMessages}/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ));
  }


  Future<void> updateStatus(int id, String status) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    await api.patch(
      '${Endpoints.contactMessages}/$id/status',
      data: {"status": status},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}