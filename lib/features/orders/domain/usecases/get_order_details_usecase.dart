import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class GetOrderDetailsUseCase {
  final OrdersRepository repo;

  GetOrderDetailsUseCase(this.repo);

  Future<OrderEntity> call(int orderId) {
    return repo.getOrderDetails(orderId);
  }
}