import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class AddItemToOrderUseCase {
  final OrdersRepository repo;

  AddItemToOrderUseCase(this.repo);

  Future<void> call({
    required int orderId,
    required int productId,
    required int quantity,
  }) {
    return repo.addItem(
      orderId: orderId,
      productId: productId,
      quantity: quantity,
    );
  }
}