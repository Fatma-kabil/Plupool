import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class ReplaceOrderItemUseCase {
  final OrdersRepository repo;

  ReplaceOrderItemUseCase(this.repo);

  Future<void> call({
    required int orderId,
    required int itemId,
    required int newProductId,
    int? quantity,
  }) {
    return repo.replaceItem(
      orderId: orderId,
      itemId: itemId,
      newProductId: newProductId,
      quantity: quantity,
    );
  }
}