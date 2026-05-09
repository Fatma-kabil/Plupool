class UserOrderModel {
  final int id;
  final String orderNumber;
  final String status;
  final double totalAmount;
  final double grandTotal;
  final String paymentMethod;
  final DateTime createdAt;

  UserOrderModel({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.totalAmount,
    required this.grandTotal,
    required this.paymentMethod,
    required this.createdAt,
  });

  factory UserOrderModel.fromJson(Map<String, dynamic> json) {
    return UserOrderModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      orderNumber: json['order_number'] ?? '',
      status: json['status'] ?? '',
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0.0,
      grandTotal: (json['grand_total'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['payment_method'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
    );
  }
}