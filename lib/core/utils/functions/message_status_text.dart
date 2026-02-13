import 'dart:ui';

import 'package:plupool/core/theme/app_colors.dart';

enum MessageStatus {
  newer,
  pending,
  solved,
  
}

String statusText(MessageStatus status) {
  switch (status) {
    case MessageStatus.newer:
      return "جديد";
    case MessageStatus.pending:
      return "قيد المراجعة";
    case MessageStatus.solved:
      return "تم الحل";
    
  }
}
/// ألوان كل حالة
class MessageStatusColors {
  static Map<String, dynamic> getColors(MessageStatus status) {
    switch (status) {
      case MessageStatus.newer:
        return {
'border': const Color(0xFFBBBBBB),
          'bg': AppColors.kScaffoldColor,
          'labelBg': const Color(0xFFCCE4F0),
          'labelText': AppColors.kprimarycolor,
          'progbar': Color(0xff0077B6),};
      case MessageStatus.solved:
        return {
          'border': const Color(0xFFCDF7EC), // mint green border
          'bg': const Color(0xFFCDF7EC), // نفس الخلفية

          'labelBg': const Color(0xFFACF1DF),
          'labelText': const Color(0xFF30DDB0),
           'progbar': Color(0xff05B285),
        };

      case MessageStatus.pending: // 🟠 مجدولة
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
