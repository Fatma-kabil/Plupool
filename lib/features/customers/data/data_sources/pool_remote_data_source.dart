import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/customers/data/models/user_pool_model.dart';

class PoolRemoteDataSource {
  final ApiService api;

  PoolRemoteDataSource(this.api);

  Future<UserPoolModel> getUserPool(int userId) async {
    final response = await api.get(
      '${Endpoints.users}/$userId/pool',
    );

    return UserPoolModel.fromJson(response.data);
  }

  Future<UserPoolModel> updateUserPool({
    required int userId,
    required Map<String, dynamic> body,
  }) async {
    final response = await api.patch(
      '${Endpoints.users}/$userId/pool',
      data: body,
    );

    return UserPoolModel.fromJson(response.data);
  }
}