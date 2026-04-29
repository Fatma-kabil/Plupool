import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class GetOrdersUseCase {
  final OrdersRepository repo;

  GetOrdersUseCase(this.repo);

  Future<List<OrderEntity>> call({
    int skip = 0,
    int limit = 100,
    String? search,
    String? status,
  }) {
    return repo.getOrders(
      skip: skip,
      limit: limit,
      search: search,
      status: status,
    );
  }
}