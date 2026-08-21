import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class VisitsViewHeader extends StatelessWidget {
  const VisitsViewHeader({
    super.key,
    required this.sourceBookingId,
    required this.currentVisitBookingId,
  });

  final int sourceBookingId;
  final int? currentVisitBookingId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'جدول الزيارات',
          style: AppTextStyles.styleSemiBold16(
            context,
          ).copyWith(
            color: AppColors.ktextcolor,
          ),
        ),

        GestureDetector(
          onTap: () {
            // مفيش زيارة حالية
            if (currentVisitBookingId == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'لا توجد زيارة حالية لإكمالها',
                  ),
                ),
              );

              return;
            }

            context.push(
              '/addcompletedvisitview',
              extra: {
                'sourceBookingId': sourceBookingId,
                'currentVisitBookingId':
                    currentVisitBookingId!,
              },
            );
          },
          child: Row(
            children: [
              Text(
                'إضافة ',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                ),
              ),
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