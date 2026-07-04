import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/myPool/data/models/pool_info_model.dart';

class PoolInfoRemoteDataSource {
  final ApiService apiService;

  PoolInfoRemoteDataSource(this.apiService);

  Future<PoolInfoModel> getPoolInfo() async {
    print("Sending request...");
    final response =await apiService.get(
  '${Endpoints.baseUrl}/pool-owner/profile/pool',

      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return PoolInfoModel.fromJson(response.data);
  }
}
