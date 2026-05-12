import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';

class DateTimeNotes extends StatelessWidget {
  const DateTimeNotes({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textDirection: TextDirection.rtl,
          formatMonthDate(date),
          style: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
        Spacer(),
        Text(
          textDirection: TextDirection.rtl,
          formatTimeArabic2(date),
          style: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
