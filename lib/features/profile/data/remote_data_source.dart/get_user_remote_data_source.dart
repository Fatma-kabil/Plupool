import 'package:dio/dio.dart'; // لازم تستورديها عشان تستخدم Options
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser(String token);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserModel> getCurrentUser(String token) async {
    final userModel = await apiService.get(
      Endpoints.getCurrentUser,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    ).then((response) => UserModel.fromJson(response.data));
    return userModel;
  }
}
