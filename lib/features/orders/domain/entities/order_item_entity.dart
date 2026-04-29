class OrderItemEntity {
  final int id;
  final int productId;
  final String productName;
  final String? image;
  final double unitPrice;
  final int quantity;
  final double totalPrice;

  OrderItemEntity({
    required this.id,
    required this.productId,
    required this.productName,
    this.image,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
  });
}