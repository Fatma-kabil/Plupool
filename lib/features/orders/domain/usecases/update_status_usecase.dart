import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class UpdateOrderStatusUseCase {
  final OrdersRepository repo;

  UpdateOrderStatusUseCase(this.repo);

  Future<void> call(int id, String status) {
    return repo.updateOrderStatus(id: id, status: status);
  }
}