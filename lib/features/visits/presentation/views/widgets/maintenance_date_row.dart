import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';

class MaintenanceDateRow extends StatelessWidget {
  const MaintenanceDateRow({super.key, required this.date, });

  final String date;
 

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,

      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: Color(0xff777777),
          size: SizeConfig.ismidwidthScreen
              ? SizeConfig.w(10)
              : SizeConfig.w(13),
        ),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          textDirection: TextDirection.rtl,
          formatMonthDate( DateTime.parse(date),),
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
        SizedBox(width: SizeConfig.w(18)),
        Text(
          textDirection: TextDirection.rtl,
          formatTimeArabic2(DateTime.parse(date),
              ),
          style: AppTextStyles.styleSemiBold14(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
