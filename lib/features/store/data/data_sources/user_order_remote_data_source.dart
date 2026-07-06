import 'package:dio/dio.dart';
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/store/data/models/store_order_model.dart';

abstract class StoreOrdersRemoteDataSource {
  Future<List<StoreOrderModel>> getStoreOrders();
}

class StoreOrdersRemoteDataSourceImpl implements StoreOrdersRemoteDataSource {
  final ApiService apiService;

  StoreOrdersRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<StoreOrderModel>> getStoreOrders() async {
    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/store/orders',

      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwicm9sZSI6InBvb2xfb3duZXIiLCJleHAiOjE3ODU1OTgzNTh9.mlzkmAfen0LawV5hQKEL7fxAeHJV7juTOf-G2LGHsDo',
        },
      ),
    );

    return (response.data as List)
        .map((e) => StoreOrderModel.fromJson(e))
        .toList();
  }
}
