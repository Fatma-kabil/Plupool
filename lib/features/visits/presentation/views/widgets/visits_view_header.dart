import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class VisitsViewHeader extends StatelessWidget {
  const VisitsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'جدول الزيارات',
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        GestureDetector(
          onTap: () {
            context.push('/addcompletedvisitview');
          },
          child: Row(
            children: [
              Text(
                'تعديل ',
                style: AppTextStyles.styleSemiBold16(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                ),
              ),
              //    SizedBox(width: SizeConfig.w(2)),
              Icon(
                Icons.edit_note_sharp,
                size: SizeConfig.w(18),
                color: AppColors.kprimarycolor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
