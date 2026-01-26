import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateRowPackage extends StatelessWidget {
  const DateRowPackage({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: SizeConfig.w(12),
          color: Color(0xff777777),
        ),
        SizedBox(width: SizeConfig.w(2)),
         Text(
          "ينتهي في",
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
        Text(
          DateFormat('EEEE d/M/yyyy', 'ar').format(date),
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
