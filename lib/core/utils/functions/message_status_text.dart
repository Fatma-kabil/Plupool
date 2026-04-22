import 'dart:ui';

import 'package:plupool/core/theme/app_colors.dart';

enum MessageStatus {
  // ignore: constant_identifier_names
  pending_review,
  // ignore: constant_identifier_names
  in_progress,
  resolved,
}


MessageStatus mapMessageApiStatus(String status) {
  switch (status) {
    case " pending_review":
      return MessageStatus.pending_review;

    case "in_progress":
      return MessageStatus.in_progress;

    case "resolved":
      return MessageStatus.resolved;

  
    default:
      return MessageStatus.pending_review;
  }
}

String statusText(MessageStatus status) {
  switch (status) {
    case MessageStatus.pending_review:
      return "جديد";
    case MessageStatus.in_progress:
      return "قيد المراجعة";
    case MessageStatus.resolved:
      return "تم الحل";
  }
}

/// ألوان كل حالة
class MessageStatusColors {
  static Map<String, dynamic> getColors(MessageStatus status) {
    switch (status) {
      case MessageStatus.pending_review:
        return {
          'border': const Color(0xFFBBBBBB),
          'bg': AppColors.kScaffoldColor,
          'labelBg': const Color(0xFFCCE4F0),
          'labelText': AppColors.kprimarycolor,
          'progbar': Color(0xff0077B6),
        };
      case MessageStatus.resolved:
        return {
          'border': const Color(0xFFCDF7EC), // mint green border
          'bg': const Color(0xFFCDF7EC), // نفس الخلفية

          'labelBg': const Color(0xFFACF1DF),
          'labelText': const Color(0xFF30DDB0),
          'progbar': Color(0xff05B285),
        };

      case MessageStatus.in_progress: // 🟠 مجدولة
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
