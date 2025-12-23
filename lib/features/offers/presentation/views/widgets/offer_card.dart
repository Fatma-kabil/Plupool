import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/offers/presentation/views/widgets/date_row.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_card_footer.dart';
import 'package:plupool/features/offers/presentation/views/widgets/offer_image_card.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offer});
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
          OfferImageCard(offer: offer),
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
                      DateRow(offer: offer),
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

                  OfferCardFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
