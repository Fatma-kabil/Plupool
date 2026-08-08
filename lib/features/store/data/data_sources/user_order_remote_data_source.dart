import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';
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
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await apiService.get(
      '${Endpoints.baseUrl}/pool-owner/store/orders',

      options: Options(
        headers: {
          'Authorization':
              'Bearer $token',
        },
      ),
    );

    return (response.data as List)
        .map((e) => StoreOrderModel.fromJson(e))
        .toList();
  }
}
