class StoreOrderEntity {
  final int id;
  final String orderNumber;
  final int customerId;
  final String customerName;
  final String customerPhone;
  final String? customerAddress;
  final String? customerProfileImage;
  final String status;
  final String statusLabel;
  final int itemsCount;
  final double totalAmount;
  final double deliveryFee;
  final double grandTotal;
  final String deliveryAddress;
  final String? deliveryPhone;
  final String paymentMethod;
  final String paymentStatus;
  final String? adminNotes;
  final String createdAt;
  final String? deliveredAt;
  final List<StoreOrderItemEntity> items;

  const StoreOrderEntity({
    required this.id,
    required this.orderNumber,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    this.customerAddress,
    this.customerProfileImage,
    required this.status,
    required this.statusLabel,
    required this.itemsCount,
    required this.totalAmount,
    required this.deliveryFee,
    required this.grandTotal,
    required this.deliveryAddress,
     this.deliveryPhone,
    required this.paymentMethod,
    required this.paymentStatus,
    this.adminNotes,
    required this.createdAt,
    this.deliveredAt,
    required this.items,
  });
}

class StoreOrderItemEntity {
  final int id;
  final int productId;
  final String productNameAr;
  final String? productImageUrl;
  final double unitPrice;
  final int quantity;
  final double totalPrice;

  const StoreOrderItemEntity({
    required this.id,
    required this.productId,
    required this.productNameAr,
    this.productImageUrl,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
  });
}
