import 'package:dio/dio.dart'; // لازم تستورديها عشان تستخدم Options
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser(String token);
  Future<UserModel> updateUser(int id, String token, UpdateUserModel data);
  Future<void> deleteUser(int id, String token);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserModel> getCurrentUser(String token) async {
    final userModel = await apiService
        .get(
          Endpoints.getCurrentUser,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          ),
        )
        .then((response) => UserModel.fromJson(response.data));
    return userModel;
  }


@override
Future <UserModel>updateUser(
  int id,
  String token,
  UpdateUserModel data,
) async {
  final formData = await data.toFormData();

  final response = await apiService.put(
    '${Endpoints.updateUser}/$id',
    data: formData,
    options: Options(
      headers: {
        'Authorization': 'Bearer $token',
        // ❌ متحطيش Content-Type بنفسك
        // Dio هيحدد multipart/form-data والـ boundary تلقائيًا
      },
    ),
  );

  return UserModel.fromJson(response.data);
}

  @override
  Future<void> deleteUser(int id, String token) async {
    await apiService.delete(
      '${Endpoints.updateUser}/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
