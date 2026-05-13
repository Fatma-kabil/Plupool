import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reserve_offer_btn.dart';

import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

class OwnerOfferCard extends StatelessWidget {
  const OwnerOfferCard({super.key, required this.offer});
  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.w(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffAAAAAA).withOpacity(.5)),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(10),
          vertical: SizeConfig.h(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.network(
                    offer.imageUrl,
                    height: SizeConfig.isWideScreen
                        ? SizeConfig.w(173)
                        : SizeConfig.h(173),
                    width: SizeConfig.w(246),
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: SizeConfig.isWideScreen
                            ? SizeConfig.w(173)
                            : SizeConfig.h(173),
                        width: SizeConfig.w(246),
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                  Positioned(
                    top: SizeConfig.h(12),
                    left: SizeConfig.w(12),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.w(9),
                        vertical: SizeConfig.h(6),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffEA5A65),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                       " خصم ${toArabicNumbers(offer.discountValue.toString())}%",
                        style: AppTextStyles.styleBold13(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            Text(
              offer.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),

            SizedBox(height: SizeConfig.h(5)),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: SizeConfig.w(10),
                  color: Color(0xff999999),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Text(
                  'العرض ساري حتي ',
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff999999)),
                ),
                Text(
                 formatDate(offer.endDate),

                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff999999)),
                ),
              ],
            ),
            Text(
              offer.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              // textDirection: TextDirection.rtl,
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),

            Spacer(),

            // زرار "Add to Cart" مع التحقق من حالة التسجيل
            ReserveOfferBtn(service: offer.title),
          ],
        ),
      ),
    );
  }
}
