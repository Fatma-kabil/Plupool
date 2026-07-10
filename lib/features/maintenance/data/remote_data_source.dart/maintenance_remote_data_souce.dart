import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/maintenance/data/models/maintenance_package_model.dart';

abstract class MaintenancePackageRemoteDataSource {
  Future<List<MaintenancePackageModel>> getPackages({String? duration});
}

class MaintenancePackageRemoteDataSourceImpl
    implements MaintenancePackageRemoteDataSource {
  final ApiService apiService;

  MaintenancePackageRemoteDataSourceImpl(this.apiService);
@override
Future<List<MaintenancePackageModel>> getPackages({
  String? duration,
}) async {
  final response = await apiService.get(
    '${Endpoints.baseUrl}/service/maintenance-packages',
    queryParams: {
      if (duration != null) "duration": duration,
    },
    options: Options(
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
      },
    ),
  );

  final List data = response.data as List;

  return data
      .map((e) => MaintenancePackageModel.fromJson(e))
      .toList();
}
}
