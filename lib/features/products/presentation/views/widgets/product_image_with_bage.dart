import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/get_badge_color.dart';
import 'package:plupool/core/utils/functions/get_badge_text.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/products/domain/entities/product_entity.dart';

class ProductImageWithBadge extends StatelessWidget {
  final Product product;

  const ProductImageWithBadge({super.key, required this.product});

  String normalizeUrl(String? url) {
    if (url == null || url.isEmpty) return "";
    return url.replaceAll("localhost", "10.0.2.2");
  }

  @override
  Widget build(BuildContext context) {
    final url = normalizeUrl(product.imageUrl);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          /// 🟡 الحالة لو مفيش صورة
          if (url.isEmpty)
            Container(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(114)
                  : SizeConfig.h(114),
              width: SizeConfig.w(95),
              color: Colors.grey[200],
              child: const Icon(
                Icons.image_not_supported,
                color: Colors.grey,
              ),
            )
          else
            Image.network(
              url,
              height: SizeConfig.isWideScreen
                  ? SizeConfig.w(114)
                  : SizeConfig.h(114),
              width: SizeConfig.w(95),
              fit: BoxFit.cover,

              /// 🛡️ fallback لو التحميل فشل
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          //  if (badgeText != null)
          Positioned(
            top: SizeConfig.h(8),
            right: SizeConfig.w(8),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(9),
                vertical: SizeConfig.h(6),
              ),
              decoration: BoxDecoration(
                //    color: getBadgeColor(product.offerBadge),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "الجديد",
                //    badgeText,
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
