import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class VerticalLineWithCircle extends StatelessWidget {
  final double lineHeight;
  final Color color;
  final double lineWidth;
  final double circleRadius;

  const VerticalLineWithCircle({
    super.key,
    this.lineHeight = 200,
    this.color = const Color(0xFF58B6F9),
    this.lineWidth = 4,
    this.circleRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // الخط العمودي
        Container(
          width: SizeConfig.w(4),
          height: SizeConfig.h(30),
          color: AppColors.kprimarycolor,
        ),
        // الدائرة في النهاية
        Container(
          width:  SizeConfig.w(10) * 2,
          height:  SizeConfig.w(10) * 2,
          decoration: BoxDecoration(
            color:  AppColors.kprimarycolor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
