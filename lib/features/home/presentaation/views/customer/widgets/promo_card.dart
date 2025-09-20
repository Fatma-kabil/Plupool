import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';

class PromoCard extends StatelessWidget {
  final PromoCardModel model;

  const PromoCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 11),
      decoration: BoxDecoration(
        color: model.cardcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          /// النصوص فوق
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // أيقونة + عنوان
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textDirection: TextDirection.rtl,
                      model.title,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: model.titlecolor),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                      model.iconPath,
                      width: SizeConfig.w(24),
                      height: SizeConfig.h(24),
                      color: model.textcolor,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // قائمة المميزات
                ...model.features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  textDirection: TextDirection.rtl, // مهم عشان العربي
  children: [
    Text(
      "•",
      style: AppTextStyles.styleRegular13(context)
          .copyWith(color: model.textcolor),
    ),
    const SizedBox(width: 6),
    Expanded(
      child: Text(
        feature,
        style: AppTextStyles.styleRegular13(context)
            .copyWith(color: model.textcolor),
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
      ),
    ),
  ],
),

                  ),
                ),

                const SizedBox(height: 60), // مساحة عشان نسيب مكان للصورة
              ],
            ),
          ),

          /// الصورة ملزوقة في آخر الكارد
          Positioned(
            bottom: 0, // هنا 0 عشان تلزق في النهاية
            left: 20,
            child: Image.asset(
              model.imagePath,
              width: SizeConfig.w(91),
              height: SizeConfig.h(96),
              fit: BoxFit.cover,
            ),
          ),

          /// الزرار شمال تحت
          Positioned(
            bottom: 25, // برضه 0 عشان يلمس الحافة
            right: 35,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: model.textcolor, width: 1),
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
                "احجز الان",
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: model.titlecolor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
