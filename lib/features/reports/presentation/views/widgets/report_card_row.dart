import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class ReportCardRow extends StatelessWidget {
  const ReportCardRow({super.key, required this.title, required this.value});
final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.styleRegular16(context).copyWith(color:Color(0xff555555))),
        Text(value, style: AppTextStyles.styleSemiBold14(context).copyWith(color:Color(0xff555555)),)
      ],
    );
  }
}
