import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconPath;
  final String buttonText; // 👈 نص الزرار
  final VoidCallback onPressed;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(20),
        horizontal: SizeConfig.w(15),
      ),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(1, 1),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: SizeConfig.isWideScreen
                    ? SizeConfig.w(14)
                    : SizeConfig.h(18), // 👈 يكبّر الـ Avatar
                backgroundColor: const Color(0xffCCE4F0),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.w(8)),
                  child: Icon(iconPath, size: SizeConfig.w(24), color: AppColors.kprimarycolor),
                ),
              ),
              SizedBox(width: SizeConfig.w(24)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.styleMedium20(context)),
                    SizedBox(height: SizeConfig.h(8)),
                    Text(
                      description,

                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(36)),
          CustomTextBtn(
            width: double.infinity,
            text: buttonText,
            onPressed: onPressed,
          ), // 👈 الزرار بياخد النص
        ],
      ),
    );
  }
}
