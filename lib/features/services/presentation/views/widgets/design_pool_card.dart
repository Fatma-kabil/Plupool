import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DesignPoolCard extends StatelessWidget {
  const DesignPoolCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xffD6D6D6), width: 1),
      ),
      child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // العنوان
          Text(
            "صمّم مسبح أحلامك",
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: AppColors.ktextcolor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // الوصف
          Text(
            "استخدم أداتنا المتطورة ثلاثية الأبعاد لتصور \nمسبحك قبل التنفيذ.",
            style: AppTextStyles.styleRegular16(context),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 16),

          // المميزات
          const FeatureItem(text: "معاينة ثلاثية الأبعاد مباشرة"),
          const FeatureItem(text: "أبعاد وأشكال مخصصة"),
          const FeatureItem(text: "خيارات متنوعة من الخامات والألوان"),
          const SizedBox(height: 10),

          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: AppColors.kprimarycolor, // لون الزرار من التصميم
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/arrow_back.svg',
                    height: SizeConfig.h(21),
                    width: SizeConfig.w(21),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "ابدأ تصميمك الآن",
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: AppColors.kprimarycolor),
                  ),
                ],
              ),
            ),
          ),

          // الزرار
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;
  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: AppTextStyles.styleRegular16(context),
            textAlign: TextAlign.right,
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/done.svg',
            height: SizeConfig.h(16),
            width: SizeConfig.w(16),
          ),
        ],
      ),
    );
  }
}
