class UserOrderEntity {
  final int id;
  final String orderNumber;
  final String status;
  final double totalAmount;
  final double grandTotal;
  final String paymentMethod;
  final DateTime createdAt;

  const UserOrderEntity({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.totalAmount,
    required this.grandTotal,
    required this.paymentMethod,
    required this.createdAt,
  });
}