import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:intl/intl.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reserve_offer_btn.dart';

class OfferDetailsCard extends StatelessWidget {
  const OfferDetailsCard({super.key, required this.offer});
  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  offer.image,
                  height: SizeConfig.isWideScreen
                      ? SizeConfig.w(125)
                      : SizeConfig.h(150),
                  width: SizeConfig.w(120),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: SizeConfig.h(12),
                  right: SizeConfig.w(12),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(7),
                      vertical: SizeConfig.h(4),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffEA5A65),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      offer.offerPercentage,
                      style: AppTextStyles.styleBold10(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: SizeConfig.w(12)),
          Expanded(
            child: SizedBox(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(125)
                  : SizeConfig.h(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الجزء العلوي
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      SizedBox(height: SizeConfig.h(5)),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: SizeConfig.w(12),
                            color: Color(0xff525252),
                          ),
                          SizedBox(width: SizeConfig.w(4)),
                          Text(
                            'العرض ساري حتي ',
                            style: AppTextStyles.styleRegular11(context),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(offer.endDate!),
                            style: AppTextStyles.styleRegular11(context),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.h(5)),
                      Text(
                        offer.desc,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleRegular13(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
                    ],
                  ),

                  // الزرار في الأسفل
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ReserveOfferBtn(service: offer.title),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
