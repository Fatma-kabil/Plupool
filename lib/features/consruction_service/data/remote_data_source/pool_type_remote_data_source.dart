import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/consruction_service/data/models/pool_type_model.dart';

class PoolTypeRemoteDataSource {
  final ApiService apiService;

  PoolTypeRemoteDataSource(this.apiService);

  Future<List<PoolTypeModel>> getPoolTypes() async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/service/pool-types',

      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return (response.data as List)
        .map((e) => PoolTypeModel.fromJson(e))
        .toList();
  }
}
