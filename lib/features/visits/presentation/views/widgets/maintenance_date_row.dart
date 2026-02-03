
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MaintenanceDateRow extends StatelessWidget {
  const MaintenanceDateRow({
    super.key,
    required this.date,
    required this.time,
  });

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
    
      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: Color(0xff777777),
          size: SizeConfig.w(13),
        ),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          textDirection: TextDirection.rtl,
          date,
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
        SizedBox(width: SizeConfig.w(18)),
        Text(
          textDirection: TextDirection.rtl,
          time,
          style: AppTextStyles.styleSemiBold14(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
