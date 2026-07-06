class CartEntity {
  final List<CartItemEntity> items;
  final int totalItems;
  final double totalAmount;
  final double deliveryFee;
  final double grandTotal;

  const CartEntity({
    required this.items,
    required this.totalItems,
    required this.totalAmount,
    required this.deliveryFee,
    required this.grandTotal,
  });
}

class CartItemEntity {
  final int id;
  final int productId;
  final int quantity;
  final String productName;
  final String? productImageUrl;
  final double unitPrice;
  final double totalPrice;
  final String createdAt;

  const CartItemEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.productName,
    required this.productImageUrl,
    required this.unitPrice,
    required this.totalPrice,
    required this.createdAt,
  });
}