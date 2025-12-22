import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/contact_request_model.dart';

abstract class ContactRemoteDataSource {
  Future<String> sendContactMessage(ContactRequestModel data);
}

class ContactRemoteDataSourceImpl
    implements ContactRemoteDataSource {
  final ApiService apiService;

  ContactRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> sendContactMessage(
      ContactRequestModel data) async {

    final response = await apiService.post(
      Endpoints.contact, // /api/v1/contact
      data: data.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    return response.data['detail'];
  }
}
