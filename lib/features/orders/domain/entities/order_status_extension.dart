import 'package:flutter/material.dart';
import 'order_status.dart';

extension OrderStatusX on OrderStatus {
  String get text {
    switch (this) {
      case OrderStatus.delivered:
        return 'تم التسليم';
      case OrderStatus.cancelled:
        return 'ملغي';
      case OrderStatus.onTheWay:
        return 'جار التوصيل';
      case OrderStatus.preparing:
        return 'قيد التحضير';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.delivered:
        return const Color(0xff05B285);
      case OrderStatus.cancelled:
        return const Color(0xffE63946);
      case OrderStatus.onTheWay:
        return const Color(0xffFF9F1C);
      case OrderStatus.preparing:
        return const Color(0xff00B4D8);
    }
  }

  IconData get icon {
    switch (this) {
      case OrderStatus.delivered:
        return Icons.check_circle_outline;
      case OrderStatus.cancelled:
        return Icons.cancel_outlined;
      case OrderStatus.onTheWay:
        return Icons.local_shipping_outlined;
      case OrderStatus.preparing:
        return Icons.hourglass_top;
    }
  }
}
