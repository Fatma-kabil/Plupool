
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class DateTimeNotes extends StatelessWidget {
  const DateTimeNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textDirection: TextDirection.rtl,
          "الخميس:  8 أكتوبر 2025 ",
          style: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
        Spacer(),
        Text(
          textDirection: TextDirection.rtl,
          "6:26 PM",
          style: AppTextStyles.styleRegular14(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
