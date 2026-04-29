import 'package:plupool/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> getOrders({
    int skip,
    int limit,
    String? search,
    String? status,
  });

  Future<OrderEntity> getOrderDetails(int id);

  Future<void> updateOrder({
    required int id,
    String? status,
    String? notes,
  });

  Future<void> deleteOrder(int id);

  Future<void> updateOrderStatus({
    required int id,
    required String status,
  });

  Future<void> addItem({
    required int orderId,
    required int productId,
    required int quantity,
  });

  Future<void> updateItem({
    required int orderId,
    required int itemId,
    int? quantity,
    double? price,
  });

  Future<void> deleteItem({
    required int orderId,
    required int itemId,
  });

  Future<void> replaceItem({
    required int orderId,
    required int itemId,
    required int newProductId,
    int? quantity,
  });
}