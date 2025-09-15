import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class OnboardingControls extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingControls({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(16), // مسافة رأسية أصغر عشان متاخدش مساحة كبيرة
        horizontal: SizeConfig.w(30),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // يخلي العناصر يمين ويسار
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // زرار "تخطي" على الشمال
          InkWell(
            onTap: onSkip,
            child: Text(
              "تخطي",
              style: AppTextStyles.styleMedium20(context).copyWith(
                color: Color(0xff999999),
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xff999999), // نفس لون النص
              ),
            ),
          ),

          // زرار "التالي" على اليمين
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kprimarycolor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // ✅ صححت هنا
              ),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(50),
                vertical: SizeConfig.h(10),
              ),
            ),
            child: Text("التالي", style: AppTextStyles.styleBold20(context)),
          ),
        ],
      ),
    );
  }
}
