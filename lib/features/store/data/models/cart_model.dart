import '../../domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.items,
    required super.totalItems,
    required super.totalAmount,
    required super.deliveryFee,
    required super.grandTotal,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json["items"] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),

      totalItems: json["total_items"],

      totalAmount: (json["total_amount"] as num).toDouble(),

      deliveryFee: (json["delivery_fee"] as num).toDouble(),

      grandTotal: (json["grand_total"] as num).toDouble(),
    );
  }
}



class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    required super.productId,
    required super.quantity,
    required super.productName,
    required super.productImageUrl,
    required super.unitPrice,
    required super.totalPrice,
    required super.createdAt,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["id"],
      productId: json["product_id"],
      quantity: json["quantity"],
      productName: json["product_name_ar"],
      productImageUrl: json["product_image_url"],
      unitPrice: (json["unit_price"] as num).toDouble(),
      totalPrice: (json["total_price"] as num).toDouble(),
      createdAt: json["created_at"],
    );
  }
}