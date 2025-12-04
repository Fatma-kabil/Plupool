import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/close_section.dart';
import 'package:plupool/core/utils/widgets/date_time_section.dart';

class ConfirmPackageBookingCard extends StatelessWidget {
  final DateTime? date;
  final TimeOfDay? time;
  final String packageType;

  const ConfirmPackageBookingCard({
    super.key,
    required this.date,
    required this.time, required this.packageType,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: SizeConfig.isWideScreen?SizeConfig.screenWidth*.85:double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(16) , vertical:SizeConfig.h(30) ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // العنوان والوصف
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffD4D4D4), width: 2),
              ),
              padding:  EdgeInsets.symmetric(vertical: SizeConfig.h(25)),
              child: Column(
                children: [
                  Text(
                    "تأكيد الحجز  ",
                    style: AppTextStyles.styleBold20(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // التاريخ والوقت
            Container(
              decoration: BoxDecoration(
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xff003C48)),
              ),
              padding:  EdgeInsets.symmetric(vertical:SizeConfig.h(15) , horizontal: SizeConfig.w(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DateTimeSection(date: date, time: time, width: 20),
                  SizedBox(width:SizeConfig.w(20) ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'نوع الخدمه',
                        style: AppTextStyles.styleBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                           packageType,
                            style: AppTextStyles.styleRegular13(
                              context,
                            ).copyWith(color: const Color(0xff006398)),
                          ),
                           SizedBox(width: SizeConfig.w(5)),
                          SvgPicture.asset(
                            'assets/icons/packages.svg',
                            color: AppColors.kprimarycolor,
                            height: SizeConfig.h(15),
                            width: SizeConfig.w(15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // الأزرار
            CloseSection(),
          ],
        ),
      ),
    );
  }
}
