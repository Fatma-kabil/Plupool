import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class DeleteOrderItemUseCase {
  final OrdersRepository repo;

  DeleteOrderItemUseCase(this.repo);

  Future<void> call({
    required int orderId,
    required int itemId,
  }) {
    return repo.deleteItem(
      orderId: orderId,
      itemId: itemId,
    );
  }
}