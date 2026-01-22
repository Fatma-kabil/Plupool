import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/rating/presentation/views/widgets/delete_rating_btn.dart';

class RatingCardHeader extends StatelessWidget {
  const RatingCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'العميل: محمد خالد',
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),

                SizedBox(height: SizeConfig.h(8.0)),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textDirection: TextDirection.rtl,
                      "الخميس:  8 أكتوبر 2025 ",
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                    SizedBox(width: SizeConfig.w(16.0)),
                    Text(
                      textDirection: TextDirection.rtl,
                      "6:26 PM",
                      style: AppTextStyles.styleRegular14(
                        context,
                      ).copyWith(color: const Color(0xff777777)),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
           DeleteRatingBtn()
          ],
        );
  }
}

  
