// lib/features/select_role/data/datasources/select_role_remote_data_source.d
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/auth/domain/entities/role.dart';


abstract class SelectRoleRemoteDataSource {
  Future<void> sendRoleToBackend(Role role);
}

class SelectRoleRemoteDataSourceImpl implements SelectRoleRemoteDataSource {
  final ApiService apiService;
  SelectRoleRemoteDataSourceImpl(this.apiService);

   Future<void> sendRoleToBackend(Role role) async {
    final response = await apiService.post(
      Endpoints.selectRole,
      data: {
        "role": role.toString().split('.').last,
      },
    );


    if (response.statusCode != 200) {
      throw Exception("Failed to send role");
    }
  }
}
