
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';

class ReportCardHeader extends StatelessWidget {
  const ReportCardHeader({
    super.key,
    required this.status,
   
  });

  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
     final colors = MessageStatusColors.getColors(status);
    return Row(
      children: [
        Text(
          ' الزيارة : #4 ',
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        Spacer(),
        Text(
          statusText(status),
          style: AppTextStyles.styleBold14(
            context,
          ).copyWith(color: colors['labelText']),
        ),
      ],
    );
  }
}
