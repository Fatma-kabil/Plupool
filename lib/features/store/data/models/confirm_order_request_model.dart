class ConfirmOrderRequestModel {
  final String deliveryAddress;
  final String deliveryPhone;
  final String paymentMethod;

  ConfirmOrderRequestModel({
    required this.deliveryAddress,
    required this.deliveryPhone,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    return {
      "delivery_address": deliveryAddress,
      "delivery_phone": deliveryPhone,
      "payment_method": paymentMethod,
    };
  }
}