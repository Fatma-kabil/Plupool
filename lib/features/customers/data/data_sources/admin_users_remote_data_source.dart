import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';

class AdminUsersRemoteDataSource {
  final ApiService api;

  AdminUsersRemoteDataSource(this.api);

  Future<Map<String, dynamic>> getUsers({
    int page = 1,
    int pageSize = 50,
    String? search,
    String? role,
    bool? isActive,
    bool? isVerified,
    String sortBy = "created_at",
    String sortOrder = "desc",
  }) async {
    final response = await api.get(
      Endpoints.users,
      queryParams: {
        "page": page,
        "page_size": pageSize,
        "search": search,
        "role": role,
        "is_active": isActive,
        "is_verified": isVerified,
        "sort_by": sortBy,
        "sort_order": sortOrder,
      }..removeWhere((key, value) => value == null),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> getUserDetails(int id) async {
    final response = await api.get('${Endpoints.users}/$id');

    return response.data;
  }

  Future<Map<String, dynamic>> addUser(

    Map<String, dynamic> body,
  ) async {
    final response = await api.post('${Endpoints.users}/', data: body);

    return response.data;
  }

  Future<Map<String, dynamic>> updateUser(
    int id,
    Map<String, dynamic> body,
  ) async {
      body.removeWhere((key, value) => value == null);
    final response = await api.put('${Endpoints.users}/$id', data: body);

    return response.data;
  }

  Future<void> deleteUser(int id) async {
    await api.delete('${Endpoints.users}$id');
  }
}
