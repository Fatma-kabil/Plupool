
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

class OfferImageCard extends StatelessWidget {
  const OfferImageCard({
    super.key,
    required this.offer,
  });

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
           CachedNetworkImage(
            imageUrl: offer.imageUrl,
            height: SizeConfig.isWideScreen
                ? SizeConfig.w(115)
                : SizeConfig.h(140),
            width: SizeConfig.w(120),
            fit: BoxFit.cover,

            placeholder: (context, url) => Container(
              height: SizeConfig.h(140),
              width: SizeConfig.w(120),
              color: Colors.grey.shade300,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),

            errorWidget: (context, url, error) => Container(
              height: SizeConfig.h(140),
              width: SizeConfig.w(120),
              color: Colors.grey.shade300,
              child: const Icon(Icons.broken_image),
            ),
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
                "خصم ${toArabicNumbers(offer.discountValue.toString())}${ "%" }",
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