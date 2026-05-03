import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class UpdateOrderItemUseCase {
  final OrdersRepository repo;

  UpdateOrderItemUseCase(this.repo);

  Future<void> call({
    required int orderId,
    required int itemId,
    int? quantity,
    double? price,
   
  }) {
    return repo.updateItem(
      orderId: orderId,
      itemId: itemId,
      quantity: quantity,
      price: price,
     
    );
  }
}