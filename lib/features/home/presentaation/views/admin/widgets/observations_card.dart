import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ObservationsCard extends StatelessWidget {
  const ObservationsCard({super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(
       //   horizontal: SizeConfig.w(32),
          vertical: SizeConfig.h(18),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kScaffoldColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xffCCE4F0),
              radius: SizeConfig.w(20),
              child: Icon(
                icon,
                size: SizeConfig.w(24),
                color: AppColors.kprimarycolor,
              ),
            ),
            SizedBox(height: SizeConfig.h(20)),
            Text(
              title,
              style: AppTextStyles.styleRegular14(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
          ],
        ),
      ),
    );
  }
}
