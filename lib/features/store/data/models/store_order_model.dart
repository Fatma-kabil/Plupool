import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';

class StoreOrderModel extends StoreOrderEntity {
  const StoreOrderModel({
    required super.id,
    required super.orderNumber,
    required super.customerId,
    required super.customerName,
    required super.customerPhone,
    super.customerAddress,
    super.customerProfileImage,
    required super.status,
    required super.statusLabel,
    required super.itemsCount,
    required super.totalAmount,
    required super.deliveryFee,
    required super.grandTotal,
    required super.deliveryAddress,
     super.deliveryPhone,
    required super.paymentMethod,
    required super.paymentStatus,
    super.adminNotes,
    required super.createdAt,
    super.deliveredAt,
    required super.items,
  });

  factory StoreOrderModel.fromJson(Map<String, dynamic> json) {
    return StoreOrderModel(
      id: json['id'],
      orderNumber: json['order_number'],
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      customerPhone: json['customer_phone'],
      customerAddress: json['customer_address'],
      customerProfileImage: json['customer_profile_image'],
      status: json['status'],
      statusLabel: json['status_label'],
      itemsCount: json['items_count'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      grandTotal: (json['grand_total'] as num).toDouble(),
      deliveryAddress: json['delivery_address'],
      deliveryPhone: json['delivery_phone'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      adminNotes: json['admin_notes'],
      createdAt: json['created_at'],
      deliveredAt: json['delivered_at'],
      items: (json['items'] as List)
          .map((e) => StoreOrderItemModel.fromJson(e))
          .toList(),
    );
  }
}

class StoreOrderItemModel extends StoreOrderItemEntity {
  const StoreOrderItemModel({
    required super.id,
    required super.productId,
    required super.productNameAr,
    super.productImageUrl,
    required super.unitPrice,
    required super.quantity,
    required super.totalPrice,
  });

  factory StoreOrderItemModel.fromJson(Map<String, dynamic> json) {
    return StoreOrderItemModel(
      id: json['id'],
      productId: json['product_id'],
      productNameAr: json['product_name_ar'],
      productImageUrl: json['product_image_url'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      quantity: json['quantity'],
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }
}
