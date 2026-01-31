import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timeline, color: Color(0xff777777), size: SizeConfig.w(20)),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          "البدء : ",
          style: AppTextStyles.styleSemiBold13(
            context,
          ).copyWith(color: Color(0xff555555)),
        ),
        Text(
          startDate.toString(),
          style: AppTextStyles.styleRegular12(
            context,
          ).copyWith(color: Color(0xff777777)),
        ),

        Spacer(),
        Icon(Icons.timeline, color: Color(0xff777777), size: SizeConfig.w(20)),
        SizedBox(width: SizeConfig.w(2)),
        Text(
          "التسليم : ",
          style: AppTextStyles.styleSemiBold13(
            context,
          ).copyWith(color: Color(0xff555555)),
        ),
        Text(
          endDate.toString(),
          style: AppTextStyles.styleRegular13(
            context,
          ).copyWith(color: Color(0xff777777)),
        ),
      ],
    );
  }
}
