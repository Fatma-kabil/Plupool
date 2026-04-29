import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class DeleteOrderUseCase {
  final OrdersRepository repo;

  DeleteOrderUseCase(this.repo);

  Future<void> call(int orderId) {
    return repo.deleteOrder(orderId);
  }
}