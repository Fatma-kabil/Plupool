
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NoOfYearsRow extends StatelessWidget {
  const NoOfYearsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.w(4)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xff2B8EC2)),
          ),
    
          child: Icon(
            Icons.workspace_premium_outlined,
            color: Color(0xff2B8EC2),
            size: SizeConfig.w(18),
          ),
        ),
        SizedBox(width: SizeConfig.w(4)),
        Text(
          "سنوات الخبرة",
          style: AppTextStyles.styleMedium16(
            context,
          ).copyWith(color: Color(0xff555555)),
        ),
    
        SizedBox(width: SizeConfig.w(115)),
        Text(
          "5 سنوات",
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
      ],
    );
  }
}
