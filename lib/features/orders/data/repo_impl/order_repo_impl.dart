import 'package:plupool/features/orders/data/data_sources/order_remote_data_source.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remote;

  OrdersRepositoryImpl(this.remote);

  /// ==============================
  /// GET ORDERS
  /// ==============================
  @override
  Future<List<OrderEntity>> getOrders({
    int skip = 0,
    int limit = 100,
    String? search,
    String? status,
  }) async {
   return await remote.getOrders({
  "skip": skip,
  "limit": limit,
  if (search != null && search.isNotEmpty) "search": search,
  if (status != null && status.isNotEmpty) "status": status,
});
  }

  /// ==============================
  /// GET ORDER DETAILS
  /// ==============================
  @override
  Future<OrderEntity> getOrderDetails(int id) async {
    return await remote.getOrder(id);
  }

  /// ==============================
  /// UPDATE ORDER
  /// ==============================
  @override
  Future<void> updateOrder({
    required int id,
    String? status,
    String? notes,
  }) async {
    await remote.updateOrder(
      id: id,
      status: status,
      notes: notes,
    );
  }

  /// ==============================
  /// DELETE ORDER
  /// ==============================
  @override
  Future<void> deleteOrder(int id) async {
    await remote.deleteOrder(id);
  }

  /// ==============================
  /// UPDATE STATUS
  /// ==============================
  @override
  Future<void> updateOrderStatus({
    required int id,
    required String status,
  }) async {
    await remote.updateStatus(id, status);
  }

  /// ==============================
  /// ADD ITEM
  /// ==============================
  @override
  Future<void> addItem({
    required int orderId,
    required int productId,
    required int quantity,
  }) async {
    await remote.addItem(
      orderId: orderId,
      productId: productId,
      quantity: quantity,
    );
  }

  /// ==============================
  /// UPDATE ITEM
  /// ==============================
  @override
  Future<void> updateItem({
    required int orderId,
    required int itemId,
    int? quantity,
    double? price,
  }) async {
    await remote.updateItem(
      orderId: orderId,
      itemId: itemId,
      quantity: quantity,
      unitPrice: price,
    );
  }

  /// ==============================
  /// DELETE ITEM
  /// ==============================
  @override
  Future<void> deleteItem({
    required int orderId,
    required int itemId,
  }) async {
    await remote.deleteItem(
      orderId: orderId,
      itemId: itemId,
    );
  }

  /// ==============================
  /// REPLACE ITEM
  /// ==============================
  @override
  Future<void> replaceItem({
    required int orderId,
    required int itemId,
    required int newProductId,
    int? quantity,
  }) async {
    await remote.replaceItem(
      orderId: orderId,
      itemId: itemId,
      newProductId: newProductId,
      quantity: quantity,
    );
  }
}