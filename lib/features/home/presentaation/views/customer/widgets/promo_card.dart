import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';

class PromoCard extends StatelessWidget {
  final PromoCardModel model;

  const PromoCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0F3F9), // خلفية فاتحة زي اللي في التصميم
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // الجزء النصي

          // صورة الموبايل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // أيقونة + عنوان
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      model.title,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.kprimarycolor),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                      model.iconPath,
                      width: SizeConfig.w(24),
                      height: SizeConfig.h(24),
                      color: AppColors.kprimarycolor,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // قائمة المميزات
                ...model.features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            feature,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.styleRegular13(
                              context,
                            ).copyWith(color: AppColors.kprimarycolor),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "•",
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: AppColors.kprimarycolor),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // زرار CTA
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      model.imagePath,
                      width: SizeConfig.w(91),
                      height: SizeConfig.h(96),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10),
                    Align(
                      alignment: Alignment.center,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.kprimarycolor,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 25,
                          ),
                        ),
                        onPressed: model.onButtonTap,
                        child: Text(
                          model.buttonText,
                          style: AppTextStyles.styleBold16(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
