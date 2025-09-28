import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
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
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title, style: AppTextStyles.styleMedium20(context)),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleRegular16(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              CircleAvatar(
                backgroundColor: const Color(0xffCCE4F0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    iconPath,
                    colorFilter: ColorFilter.mode(
                      // ✅ صح
                      AppColors.kprimarycolor,
                      BlendMode.srcIn,
                    ),
                    height: SizeConfig.h(24),
                    width: SizeConfig.w(24),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          CustomTextBtn(
            text: buttonText,
            onPressed: onPressed,
          ), // 👈 الزرار بياخد النص
        ],
      ),
    );
  }
}
