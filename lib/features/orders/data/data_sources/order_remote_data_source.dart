import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/orders/data/models/order_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plupool/core/di/service_locator.dart';

class OrdersRemoteDataSource {
  final ApiService api;

  OrdersRemoteDataSource(this.api);

  /// ==============================
  /// GET ORDERS (List + filters)
  /// ==============================

  Future<List<OrderModel>> getOrders(Map<String, dynamic> query) async {
    final storage = sl<FlutterSecureStorage>();
    final token = await storage.read(key: 'token');
    final response = await api.get(
      Endpoints.orders,
      queryParams: query,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> getUserOrders({
    required int userId,
    String? status,
    String? paymentMethod,
    int page = 1,
    int pageSize = 10,
  }) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    final response = await api.get(
      '${Endpoints.users}/$userId/orders',
      queryParams: {
        "status": status,
        "payment_method": paymentMethod,
        "page": page,
        "page_size": pageSize,
      }..removeWhere((key, value) => value == null),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return response.data;
  }

  /// ==============================
  /// GET ORDER DETAILS
  /// ==============================

  Future<OrderModel> getOrder(int id) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    final response = await api.get(
      '${Endpoints.orders}/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return OrderModel.fromJson(response.data);
  }

  /// ==============================
  /// UPDATE ORDER (status + notes)
  /// ==============================

  Future<void> updateOrder({
    required int id,
    String? status,
    String? notes,
  }) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.put(
      '${Endpoints.orders}/$id',
      data: {
        if (status != null) "status": status,
        if (notes != null) "admin_notes": notes,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ==============================
  /// DELETE ORDER
  /// ==============================

  Future<void> deleteOrder(int id) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.delete(
      '${Endpoints.orders}/$id',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ==============================
  /// UPDATE STATUS ONLY
  /// ==============================

  Future<void> updateStatus(int id, String status) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.put(
      '${Endpoints.orders}/$id/status',
      data: {"new_status": status},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    
    );
  }

  /// ==============================
  /// ADD ITEM TO ORDER
  /// ==============================

  Future<void> addItem({
    required int orderId,
    required int productId,
    required int quantity,
  }) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.post(
      '${Endpoints.orders}/$orderId/items',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParams: {"product_id": productId, "quantity": quantity},
    );
  }

  /// ==============================
  /// UPDATE ITEM (qty / price)
  /// ==============================

  Future<void> updateItem({
    required int orderId,
    required int itemId,
    int? quantity,
    double? unitPrice,
  }) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.put(
      '${Endpoints.orders}/$orderId/items/$itemId',
      queryParams: {
        if (quantity != null) "quantity": quantity,
        if (unitPrice != null) "unit_price": unitPrice,
      },
      data: {
        if (quantity != null) "quantity": quantity,
        if (unitPrice != null) "unit_price": unitPrice,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ==============================
  /// DELETE ITEM
  /// ==============================

  Future<void> deleteItem({
    required int orderId,
    required int itemId,
    bool restoreStock = true,
  }) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.delete(
      '${Endpoints.orders}/$orderId/items/$itemId',
      data: {"restore_stock": restoreStock},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// ==============================
  /// REPLACE ITEM
  /// ==============================

  Future<void> replaceItem({
    required int orderId,
    required int itemId,
    required int newProductId,
    int? quantity,
  }) async {
    final token = await sl<FlutterSecureStorage>().read(key: 'token');
    await api.patch(
      '${Endpoints.orders}/$orderId/items/$itemId/replace',
      data: {
        "new_product_id": newProductId,
        if (quantity != null) "quantity": quantity,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
