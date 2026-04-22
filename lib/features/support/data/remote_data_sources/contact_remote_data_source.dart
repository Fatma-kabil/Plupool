import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/support/data/models/contact_model.dart';

class ContactRemoteDataSource  {
  final ApiService api;

  ContactRemoteDataSource(this.api);

  
  Future<List<ContactModel>> getMessages({
    String? status,
    String? senderRole,
    String? search,
  }) async {
    final response = await api.get(
      Endpoints.contactMessages,
     queryParams : {
        'status': status,
        'sender_role': senderRole,
        'search': search,
        'skip': 0,
        'limit': 100,
      }..removeWhere((k, v) => v == null),
    );

    final list = response.data['messages'] as List;

    return list.map((e) => ContactModel.fromJson(e)).toList();
  }

 
  Future<ContactModel> getMessageDetails(int id) async {
    final response =
        await api.get('${Endpoints.contactMessages}/$id');

    return ContactModel.fromJson(response.data);
  }

 
  Future<void> deleteMessage(int id) async {
    await api.delete('${Endpoints.contactMessages}/$id');
  }


  Future<void> updateStatus(int id, String status) async {
    await api.patch(
      '${Endpoints.contactMessages}/$id/status',
      data: {"status": status},
    );
  }
}