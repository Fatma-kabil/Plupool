import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class PoolReserveHeaderCard extends StatelessWidget {
  final String title;

  final String description;

  const PoolReserveHeaderCard({
    super.key,
    required this.title,

    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // 👈 النص عربي
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.kScaffoldColor,
          border: Border.all(width: 2, color: Color(0xffD4D4D4)), // border
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(38) , vertical:SizeConfig.h(12) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: Colors.black),
              ),
              const SizedBox(height: 12),

              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff777777)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
