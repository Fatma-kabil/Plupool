
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
     // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
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
              borderRadius:  BorderRadius.circular(
               20
              ),
              child:Image.asset(
                offer.image,
                height: SizeConfig.h(173),
                width: SizeConfig.w(246),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(offer.title,
                style:
                    AppTextStyles.styleSemiBold20(context).copyWith(color: AppColors.kprimarycolor)),
            const SizedBox(height: 6),
            Text(offer.desc,
                style: AppTextStyles.styleRegular16(context).copyWith(color: AppColors.ktextcolor)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(offer.oldPrice,
                    style: AppTextStyles.styleRegular14(context).copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xff808080))),
                const SizedBox(width: 12),
                Text(offer.newPrice,
                    style: AppTextStyles.styleBold16(context)
                        ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, ),
              child: Row(
              //  mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Icon(Icons.arrow_back, size: SizeConfig.w(18), color: AppColors.kprimarycolor),
                   SizedBox(width: 10),
                  Text("تفاصيل",
                      style: AppTextStyles.styleBold16(context)),
                 
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
