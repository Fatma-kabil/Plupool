import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class UpdateOrderUseCase {
  final OrdersRepository repo;

  UpdateOrderUseCase(this.repo);

  Future<void> call({
    required int id,
    String? status,
    String? notes,
  }) {
    return repo.updateOrder(
      id: id,
      status: status,
      notes: notes,
    );
  }
}