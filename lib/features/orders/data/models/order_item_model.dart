import 'package:plupool/features/orders/domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.id,
    required super.productId,
    required super.productName,
    super.image,
    required super.unitPrice,
    required super.quantity,
    required super.totalPrice,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      productId: json['product_id'],
      productName: json['product_name_ar'] ?? '',
      image: json['product_image_url'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      quantity: json['quantity'],
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product_id": productId,
      "product_name_ar": productName,
      "product_image_url": image,
      "unit_price": unitPrice,
      "quantity": quantity,
      "total_price": totalPrice,
    };
  }
}