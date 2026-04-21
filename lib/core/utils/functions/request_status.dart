import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';

/// يمثل حالة الطلب (عاجل - قيد التنفيذ - مكتمل - مجدولة)
enum RequestStatus {
  urgent,
  inProgress,
  completed,
  scheduled, // 🟠 الحالة الجديدة
}
RequestStatus mapApiStatus(String status) {
  switch (status) {
    case "completed":
      return RequestStatus.completed;

    case "in_progress":
      return RequestStatus.inProgress;

    case "confirmed":
      return RequestStatus.scheduled;

    case "pending":
    default:
      return RequestStatus.urgent;
  }
}

/// نص الحالة باللغة العربية
String getStatusText(RequestStatus status) {
  switch (status) {
    case RequestStatus.urgent:
      return 'عاجله';
    case RequestStatus.inProgress:
      return 'قيد التنفيذ';
    case RequestStatus.completed:
      return 'مكتملة';
    case RequestStatus.scheduled:
      return 'مجدولة';
  }
}

/// ألوان كل حالة
class RequestStatusColors {
  static Map<String, dynamic> getColors(RequestStatus status) {
    switch (status) {
      case RequestStatus.urgent:
        return {
          'border': const Color(0xFFC0303A),
          'bg': AppColors.kScaffoldColor,
          'labelBg': const Color(0xFFFAD7DA),
          'labelText': const Color(0xFFC0303A),

        };

      case RequestStatus.inProgress:
        return {
          'border': const Color(0xFFBBBBBB),
          'bg': AppColors.kScaffoldColor,
          'labelBg': const Color(0xFFCCE4F0),
          'labelText': AppColors.kprimarycolor,
          'progbar': Color(0xff0077B6),
        };

      case RequestStatus.completed:
        return {
          'border': const Color(0xFFCDF7EC), // mint green border
          'bg': const Color(0xFFCDF7EC), // نفس الخلفية

          'labelBg': const Color(0xFFACF1DF),
          'labelText': const Color(0xFF30DDB0),
           'progbar': Color(0xff05B285),
        };

      case RequestStatus.scheduled: // 🟠 مجدولة
        return {
          'border': const Color(0xFFBBBBBB), // برتقالي فاتح
          'bg': AppColors.kScaffoldColor,
          'labelBg': const Color(0xFFFFECD2),
          'labelText': const Color(0xFFD48417), // برتقالي غامق
           'progbar': Color.fromARGB(255, 233, 146, 25),
        };
    }
  }
}
