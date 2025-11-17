
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class TimeDateRow extends StatelessWidget {
  const TimeDateRow({
    super.key,
    required this.formattedDate,
  });

  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(Icons.calendar_today, color: Color(0xff999999), size:SizeConfig.w( 13)),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          textDirection: TextDirection.rtl,
          formattedDate,
          style: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color: Color(0xff999999)),
        ),
      ],
    );
  }
}
