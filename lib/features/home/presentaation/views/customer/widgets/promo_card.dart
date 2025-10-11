import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/BottomNavBar/presentation/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';


class PromoCard extends StatelessWidget {
  final PromoCardModel model;

  const PromoCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right: SizeConfig.w(11) ),
      decoration: BoxDecoration(
        color: model.cardcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          /// النصوص فوق
          Padding(
            padding:  EdgeInsets.symmetric
            (horizontal:  SizeConfig.w(10),vertical:  SizeConfig.h(10)
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // أيقونة + عنوان
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      model.title,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: model.titlecolor),
                    ),
                     SizedBox(width: SizeConfig.w(4) ),
                    SvgPicture.asset(
                      model.iconPath,
                      width: SizeConfig.w(20),
                      height: SizeConfig.w(20),
                      color: model.textcolor,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // قائمة المميزات
                ...model.features.map(
                  (feature) => Padding(
                    padding:  EdgeInsets.only(bottom: SizeConfig.h(8) ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          "•",
                          style: AppTextStyles.styleRegular13(
                            context,
                          ).copyWith(color: model.textcolor),
                        ),
                         SizedBox(width:  SizeConfig.w(6)),
                        Expanded(
                          child: Text(
                            feature,
                            style: AppTextStyles.styleRegular13(
                              context,
                            ).copyWith(color: model.textcolor),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),

          /// الصورة ملزوقة في آخر الكارد
          Positioned(
            bottom: 0,
            left:SizeConfig.h(20) ,
            child: Image.asset(
              model.imagePath,
              width: SizeConfig.w(90),
              height: SizeConfig.w(96),
              fit: BoxFit.fill,
            ),
          ),

          /// الزرار يمين تحت
          Positioned(
            bottom: SizeConfig.h(25),
            right:SizeConfig.w(30) ,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: model.textcolor, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:  EdgeInsets.symmetric(
                  vertical:  SizeConfig.h(6),
                  horizontal:  SizeConfig.w(25),
                ),
              ),
              onPressed: () {
                context.read<BottomNavCubit>().changeCurrentIndex(
                  1,
                ); // 1 = صفحة الخدمات
              },
              child: Text(
                "ابدأ الان",
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
