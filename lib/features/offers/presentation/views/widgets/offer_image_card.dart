
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/offer_model.dart';

class OfferImageCard extends StatelessWidget {
  const OfferImageCard({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.asset(
            offer.image,
            height: SizeConfig.isWideScreen
                ? SizeConfig.w(115)
                : SizeConfig.h(140),
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
                borderRadius: BorderRadius.circular(5),
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
    );
  }
}