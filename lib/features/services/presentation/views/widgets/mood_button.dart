
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class MoodButton extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const MoodButton({
    super.key,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //  width: 70,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0x4FCCE4F0)
              : Colors.white, // 👈 الخلفية
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF55A4CE)
                : AppColors.hintTextColor, // 👈 البوردر
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              height: SizeConfig.h(30),
              width: SizeConfig.w(30),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
