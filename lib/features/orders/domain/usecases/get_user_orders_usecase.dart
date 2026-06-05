import 'package:plupool/features/orders/domain/repos/order_repo.dart';

class GetUserOrdersUseCase {
  final OrdersRepository repo;

  GetUserOrdersUseCase(this.repo);

  Future<Map<String, dynamic>> call({
    required int userId,
    String? status,
    String? paymentMethod,
    int page = 1,
    int pageSize = 10,
  }) {
    return repo.getUserOrders(
      userId: userId,
      status: status,
      paymentMethod: paymentMethod,
      page: page,
      pageSize: pageSize,
    );
  }
}
