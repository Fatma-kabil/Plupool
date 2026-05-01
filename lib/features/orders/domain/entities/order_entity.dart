import 'package:plupool/features/orders/domain/entities/order_item_entity.dart';

class OrderEntity {
  final int id;
  final String orderNumber;
  final double totalAmount;
  final double deliveryFee;
  final double grandTotal;
  final String deliveryAddress;
  final String deliveryPhone;
  final String paymentMethod;
  final String paymentStatus;
  final String status;
  final String? adminNotes;
  final DateTime createdAt;
  final DateTime? deliveredAt;
  final List<OrderItemEntity> items;
  final int userId;
  final String userName;
  final String userPhone;
  final String? userImage;
  final int itemsCount;
  final bool userIsActive;
  final DateTime? adminNotesUpdated;
  final String userRole;

  OrderEntity({
    required this.id,
    required this.orderNumber,
    required this.totalAmount,
    required this.deliveryFee,
    required this.grandTotal,
    required this.deliveryAddress,
    required this.deliveryPhone,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.status,
    this.adminNotes,
    required this.createdAt,
    this.deliveredAt,
    required this.items,
    required this.userId,
    required this.userName,
    required this.userPhone,
    this.userImage,
    required this.itemsCount,
    required this.userIsActive,
    this.adminNotesUpdated,
    required this.userRole, 
  });
}
