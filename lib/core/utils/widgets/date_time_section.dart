import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';

class DateTimeSection extends StatelessWidget {
  final DateTime? date;
  final TimeOfDay? time;
  final double? width;

  const DateTimeSection({
    super.key,
    required this.date,
    required this.time,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        _buildDateColumn(context),
        SizedBox(width: width ??SizeConfig.w(50) ),
        _buildTimeColumn(context),
      ],
    );
  }

  Column _buildDateColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'التاريخ',
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              formatDate(date!),
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: const Color(0xff006398)),
            ),
             SizedBox(width: SizeConfig.w(5)),
             Icon(
              Icons.calendar_today,
              size: SizeConfig.w(15),
              color: AppColors.kprimarycolor,
            ),
          ],
        ),
      ],
    );
  }

  Column _buildTimeColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'الوقت',
          style: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              time!.format(context),
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: const Color(0xff006398)),
            ),
             SizedBox(width: SizeConfig.w(5)),
             Icon(
              Icons.access_time,
              size: SizeConfig.w(15),
              color: AppColors.kprimarycolor,
            ),
          ],
        ),
      ],
    );
  }
}
