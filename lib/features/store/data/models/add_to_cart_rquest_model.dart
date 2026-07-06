class AddToCartRequestModel {
  final int productId;
  final int quantity;

  const AddToCartRequestModel({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "quantity": quantity,
    };
  }
}