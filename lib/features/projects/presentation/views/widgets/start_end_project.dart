import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class StartEndProject extends StatelessWidget {
  const StartEndProject({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  final DateTime startDate;
  final DateTime endDate;

  String formatDate(DateTime date) {
    return DateFormat('d/M/yyyy', 'ar').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timeline,
          color: const Color(0xff777777),
          size: SizeConfig.w(18),
        ),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          "البدء : ",
          style: AppTextStyles.styleSemiBold14(
            context,
          ).copyWith(color: const Color(0xff555555)),
        ),
        Text(
          formatDate(startDate),
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),

        const Spacer(),

        Icon(
          Icons.timeline,
          color: const Color(0xff777777),
          size: SizeConfig.w(18),
        ),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          "التسليم : ",
          style: AppTextStyles.styleSemiBold14(
            context,
          ).copyWith(color: const Color(0xff555555)),
        ),
        Text(
          formatDate(endDate),
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: const Color(0xff777777)),
        ),
      ],
    );
  }
}
