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

  OrderEntity copyWith({
    int? id,
    String? orderNumber,
    double? totalAmount,
    double? deliveryFee,
    double? grandTotal,
    String? deliveryAddress,
    String? deliveryPhone,
    String? paymentMethod,
    String? paymentStatus,
    String? status,
    String? adminNotes,
    DateTime? createdAt,
    DateTime? deliveredAt,
    List<OrderItemEntity>? items,
    int? userId,
    String? userName,
    String? userPhone,
    String? userImage,
    int? itemsCount,
    bool? userIsActive,
    DateTime? adminNotesUpdated,
    String? userRole,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      totalAmount: totalAmount ?? this.totalAmount,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      grandTotal: grandTotal ?? this.grandTotal,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryPhone: deliveryPhone ?? this.deliveryPhone,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      status: status ?? this.status,
      adminNotes: adminNotes ?? this.adminNotes,
      createdAt: createdAt ?? this.createdAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      items: items ?? this.items,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhone: userPhone ?? this.userPhone,
      userImage: userImage ?? this.userImage,
      itemsCount: itemsCount ?? this.itemsCount,
      userIsActive: userIsActive ?? this.userIsActive,
      adminNotesUpdated: adminNotesUpdated ?? this.adminNotesUpdated,
      userRole: userRole ?? this.userRole,
    );
  }
}