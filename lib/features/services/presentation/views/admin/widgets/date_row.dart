
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateTime.parse(date); // ✅ التحويل

    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: SizeConfig.w(12),
          color: const Color(0xff777777),
        ),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          DateFormat('EEEE yyyy/M/d', 'ar').format(parsedDate),
          style: AppTextStyles.styleRegular13(context)
              .copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}