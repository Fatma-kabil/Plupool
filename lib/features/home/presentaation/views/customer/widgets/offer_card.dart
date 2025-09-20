import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xffAAAAAA)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    offer.image,
                    height: SizeConfig.h(173),
                    width: SizeConfig.w(246),
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffEA5A65),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        offer.offerPercentage,
                        style: AppTextStyles.styleBold13(
                          context,
                        ).copyWith(color: Color(0xffffffff)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              offer.title,
              style: AppTextStyles.styleSemiBold20(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),
            const SizedBox(height: 5),
            Text(
              textDirection: TextDirection.rtl,
              offer.desc,
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  offer.oldPrice,
                  style: AppTextStyles.styleRegular14(context).copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xff808080),
                  ),
                ),
                const SizedBox(width: 12),
                Text(offer.newPrice, style: AppTextStyles.styleBold16(context)),
              ],
            ),
           Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 12,bottom: 15),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: SizeConfig.w(18),
                    color: AppColors.kprimarycolor,
                  ),
                  SizedBox(width: 10),
                  Text("تفاصيل", style: AppTextStyles.styleBold16(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
