import 'package:flutter/material.dart';
import 'order_status.dart';

extension OrderStatusExtension on OrderStatus {
  /// =========================
  /// 🇪🇬 Arabic name
  /// =========================
  ///

  String get arName {
    switch (this) {
      case OrderStatus.PENDING:
        return "قيد الانتظار";
      case OrderStatus.CONFIRMED:
        return "تم التأكيد";
      case OrderStatus.PROCESSING:
        return "جاري التجهيز";
      case OrderStatus.SHIPPED:
        return "تم الشحن";
      case OrderStatus.DELIVERED:
        return "تم التسليم";
      case OrderStatus.CANCELLED:
        return "ملغي";
    }
  }

  /// =========================
  /// 🎨 Color
  /// =========================
  Color get color {
    switch (this) {
      case OrderStatus.PENDING:
        return const Color(0xffFFB703); // yellow
      case OrderStatus.CONFIRMED:
        return const Color(0xff219EBC); // blue
      case OrderStatus.PROCESSING:
        return const Color(0xff00B4D8); // cyan
      case OrderStatus.SHIPPED:
        return const Color(0xffFB8500); // orange
      case OrderStatus.DELIVERED:
        return const Color(0xff05B285); // green
      case OrderStatus.CANCELLED:
        return const Color(0xffE63946); // red
    }
  }

  /// =========================
  /// 📌 Icon
  /// =========================
  IconData get icon {
    switch (this) {
      case OrderStatus.PENDING:
        return Icons.hourglass_empty;
      case OrderStatus.CONFIRMED:
        return Icons.verified_outlined;
      case OrderStatus.PROCESSING:
        return Icons.settings_suggest_outlined;
      case OrderStatus.SHIPPED:
        return Icons.local_shipping_outlined;
      case OrderStatus.DELIVERED:
        return Icons.check_circle_outline;
      case OrderStatus.CANCELLED:
        return Icons.cancel_outlined;
    }
  }

  /// =========================
  /// 🔁 to API string
  /// =========================
  String get apiValue {
    switch (this) {
      case OrderStatus.PENDING:
        return "PENDING";
      case OrderStatus.CONFIRMED:
        return "CONFIRMED";
      case OrderStatus.PROCESSING:
        return "PROCESSING";
      case OrderStatus.SHIPPED:
        return "SHIPPED";
      case OrderStatus.DELIVERED:
        return "DELIVERED";
      case OrderStatus.CANCELLED:
        return "CANCELLED";
    }
  }

  /// =========================
  /// 🔁 from String (العكس)
  /// =========================
  static OrderStatus fromString(String value) {
    switch (value.toUpperCase()) {
      case "PENDING":
        return OrderStatus.PENDING;
      case "CONFIRMED":
        return OrderStatus.CONFIRMED;
      case "PROCESSING":
        return OrderStatus.PROCESSING;
      case "SHIPPED":
        return OrderStatus.SHIPPED;
      case "DELIVERED":
        return OrderStatus.DELIVERED;
      case "CANCELLED":
        return OrderStatus.CANCELLED;
      default:
        return OrderStatus.PENDING;
    }
  }
}

OrderStatus parseOrderStatus(String value) {
  switch (value.toUpperCase()) {
    case "PENDING":
      return OrderStatus.PENDING;
    case "CONFIRMED":
      return OrderStatus.CONFIRMED;
    case "PROCESSING":
      return OrderStatus.PROCESSING;
    case "SHIPPED":
      return OrderStatus.SHIPPED;
    case "DELIVERED":
      return OrderStatus.DELIVERED;
    case "CANCELLED":
      return OrderStatus.CANCELLED;
    default:
      return OrderStatus.PENDING;
  }
}

String orderStatusToApi(String arabicStatus) {
  switch (arabicStatus) {
    case "قيد الانتظار":
      return OrderStatus.PENDING.apiValue;

    case "تم التأكيد":
      return OrderStatus.CONFIRMED.apiValue;

    case "جاري التجهيز":
      return OrderStatus.PROCESSING.apiValue;

    case "تم الشحن":
      return OrderStatus.SHIPPED.apiValue;

    case "تم التسليم":
      return OrderStatus.DELIVERED.apiValue;

    case "ملغي":
      return OrderStatus.CANCELLED.apiValue;

    default:
      return OrderStatus.PENDING.apiValue;
  }
}

String arabicName(String arabicStatus) {
  switch (arabicStatus) {
    case "PENDING":
      return "قيد الانتظار";
    case "CONFIRMED":
      return "تم التأكيد";
    case "PROCESSING":
      return "جاري التجهيز";
    case "SHIPPED":
      return "تم الشحن";
    case "DELIVERED":
      return "تم التسليم";
    case "CANCELLED":
      return "ملغي";
    default:
      return "قيد الانتظار";
  }
}
