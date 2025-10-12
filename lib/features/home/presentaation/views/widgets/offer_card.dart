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
      margin: EdgeInsets.only(right: SizeConfig.w(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xffAAAAAA).withOpacity(.5)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(10),
          vertical: SizeConfig.h(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    offer.image,
                    height:SizeConfig.isWideScreen? SizeConfig.w(173):SizeConfig.h(173),
                    width: SizeConfig.w(246),
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: SizeConfig.h( 12),
                    right: SizeConfig.w(12) ,
                    child: Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal:  SizeConfig.w(9),
                        vertical:  SizeConfig.h(6),
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
             SizedBox(height: SizeConfig.h(5) ),
            Text(
              textDirection: TextDirection.rtl,
              offer.desc,
              style: AppTextStyles.styleRegular16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
             SizedBox(height: SizeConfig.h(10)),
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
                 SizedBox(width: SizeConfig.w(12) ),
                Text(offer.newPrice, style: AppTextStyles.styleBold16(context)),
              ],
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(left: SizeConfig.w(12) , bottom: SizeConfig.h (8)),
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
