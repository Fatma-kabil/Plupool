import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/orders/data/models/order_model.dart';

class OrdersRemoteDataSource  {
  final ApiService api;

  OrdersRemoteDataSource(this.api);

  /// ==============================
  /// GET ORDERS (List + filters)
  /// ==============================
 
  Future<List<OrderModel>> getOrders(Map<String, dynamic> query) async {
    final response = await api.get(
      Endpoints.orders,
      queryParams: query,
    );

    return (response.data as List)
        .map((e) => OrderModel.fromJson(e))
        .toList();
  }

  /// ==============================
  /// GET ORDER DETAILS
  /// ==============================
 
  Future<OrderModel> getOrder(int id) async {
    final response = await api.get('${Endpoints.orders}/$id');
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
    await api.put(
      '${Endpoints.orders}/$id',
      data: {
        if (status != null) "status": status,
        if (notes != null) "admin_notes": notes,
      },
    );
  }

  /// ==============================
  /// DELETE ORDER
  /// ==============================
 
  Future<void> deleteOrder(int id) async {
    await api.delete('${Endpoints.orders}/$id');
  }

  /// ==============================
  /// UPDATE STATUS ONLY
  /// ==============================
 
  Future<void> updateStatus(int id, String status) async {
    await api.put(
      '${Endpoints.orders}/$id/status',
     data : {
        "new_status": status,
      },
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
    await api.post(
      '${Endpoints.orders}/$orderId/items',
      data: {
        "product_id": productId,
        "quantity": quantity,
      },
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
    await api.put(
      '${Endpoints.orders}/$orderId/items/$itemId',
      data: {
        if (quantity != null) "quantity": quantity,
        if (unitPrice != null) "unit_price": unitPrice,
      },
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
    await api.delete(
      '${Endpoints.orders}/$orderId/items/$itemId',
      data: {
        "restore_stock": restoreStock,
      },
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
    await api.patch(
      '${Endpoints.orders}/$orderId/items/$itemId/replace',
      data: {
        "new_product_id": newProductId,
        if (quantity != null) "quantity": quantity,
      },
    );
  }
}