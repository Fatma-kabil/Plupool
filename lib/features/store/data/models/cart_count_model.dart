import '../../domain/entities/cart_count_entity.dart';

class CartCountModel extends CartCountEntity {
  const CartCountModel({
    required super.totalItems,
    required super.totalLines,
  });

  factory CartCountModel.fromJson(Map<String, dynamic> json) {
    return CartCountModel(
      totalItems: json['total_items'],
      totalLines: json['total_lines'],
    );
  }
}