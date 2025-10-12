import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_carousel.dart';

class OfferSection extends StatelessWidget {
   final List <OfferModel> offers;
  const OfferSection({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
             Text(
              'عروضنا الخاصة',
              style: AppTextStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
             Spacer(),
            Text(
              ' عرض الكل',
              style: AppTextStyles.styleSemiBold16(context).copyWith(
                color: AppColors.kprimarycolor,
                decoration: TextDecoration.underline,
              ),
              
            ),
          
            
          ],
        ),
        SizedBox(height: 16),
        OffersCarousel(offers: offers,)
      ],
    );
  }
}
