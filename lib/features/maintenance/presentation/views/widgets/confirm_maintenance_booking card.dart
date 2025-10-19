import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/close_section.dart';
import 'package:plupool/core/utils/widgets/date_time_section.dart';

class ConfirmMaintenanceBookingCard extends StatelessWidget {
  final DateTime? date;
  final TimeOfDay? time;

  const ConfirmMaintenanceBookingCard({
    super.key,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        width: SizeConfig.w(340),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(16),vertical: SizeConfig.h(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // العنوان والوصف
            Container(
              decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffD4D4D4), width: 2),
              ),
              padding:  EdgeInsets.symmetric(vertical: SizeConfig.h(15), horizontal: SizeConfig.w(38)),
              child: Column(
                children: [
                  Text(
                    "تأكيد حجز خدمة الصيانة",
                    style: AppTextStyles.styleBold20(context).copyWith(color: AppColors.ktextcolor),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    textDirection: TextDirection.rtl,
                    "صيانة دورية لتحافظ على نقاء وأمان حمام السباحة الخاص بك.",
                    style: AppTextStyles.styleRegular13(
                      context,
                    ).copyWith(color: Color(0xff777777)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // التاريخ والوقت
            Container(
               decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xff003C48), ),
              ),
              padding:  EdgeInsets.symmetric(vertical: SizeConfig.h(15), horizontal: SizeConfig.w(20)),
              child: DateTimeSection(date: date, time: time)),
            const SizedBox(height: 25),

            // الأزرار
            CloseSection(),
          ],
        ),
      ),
    );
  }
}
