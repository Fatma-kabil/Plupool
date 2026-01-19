import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_badge_color.dart';
import 'package:plupool/core/utils/functions/get_badge_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

class ProductImageWithBadge extends StatelessWidget {
  final ProductModel product;

  const ProductImageWithBadge({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final badgeText = getBadgeText(product);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.asset(
            product.image,
            height: SizeConfig.isWideScreen
                ? SizeConfig.w(114)
                : SizeConfig.h(114),
            width: SizeConfig.w(95),
            fit: BoxFit.cover,
          ),
          if (badgeText != null)
            Positioned(
              top: SizeConfig.h(8),
              right: SizeConfig.w(8),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(9),
                  vertical: SizeConfig.h(6),
                ),
                decoration: BoxDecoration(
                  color: getBadgeColor(product.badge),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  badgeText,
                  style: AppTextStyles.styleBold10(context).copyWith(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
