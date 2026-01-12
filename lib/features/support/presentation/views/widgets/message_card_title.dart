import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MessageCardTitle extends StatelessWidget {
  const MessageCardTitle({super.key, required this.role, required this.name});
  final String role;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$role : $name',
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: Color(0xff555555)),
        ),
        Spacer(),
        Text(
          'تفاصيل',
          style: AppTextStyles.styleSemiBold16(context).copyWith(
            color: AppColors.kprimarycolor,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.kprimarycolor,
          size: SizeConfig.w(12),
        ),
      ],
    );
  }
}
