import 'package:plupool/features/orders/data/models/order_item_model.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.orderNumber,
    required super.totalAmount,
    required super.deliveryFee,
    required super.grandTotal,
    required super.deliveryAddress,
    required super.deliveryPhone,
    required super.paymentMethod,
    required super.paymentStatus,
    required super.status,
    super.adminNotes,
    required super.createdAt,
    super.deliveredAt,
    required super.items,
    required super.userId,
    required super.userName,
    required super.userPhone,
    super.userImage,
    required super.itemsCount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderNumber: json['order_number'],
      totalAmount: (json['total_amount']).toDouble(),
      deliveryFee: (json['delivery_fee']).toDouble(),
      grandTotal: (json['grand_total']).toDouble(),
      deliveryAddress: json['delivery_address'],
      deliveryPhone: json['delivery_phone'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      status: json['status'],
      adminNotes: json['admin_notes'],
      createdAt: DateTime.parse(json['created_at']),
      deliveredAt: json['delivered_at'] != null
          ? DateTime.parse(json['delivered_at'])
          : null,
      items: (json['order_items'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
      userId: json['user_id'],
      userName: json['user_name'],
      userPhone: json['user_phone'],
      userImage: json['user_image'],
      itemsCount: json['items_count'],
    );
  }
}