import 'package:flutter/material.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  String? getBadgeText(ProductBadge badge) {
    switch (badge) {
      case ProductBadge.discount:
        return "خصم ${product.discountPercent.toInt()}%"; // 👈 نسبة الخصم
      case ProductBadge.bestSeller:
        return "الأكثر مبيعاً";
      case ProductBadge.highPrice:
        return "الأعلى سعراً";
      case ProductBadge.lowPrice:
        return "الأقل سعراً";
      case ProductBadge.none:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final badgeText = getBadgeText(product.badge);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(product.image,
              fit: BoxFit.cover, width: double.infinity, height: 160),
          if (badgeText != null)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      if (product.hasDiscount) // 👈 لو في خصم
                        Text(
                          "${product.originalPrice.toStringAsFixed(0)} ج.م",
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(width: 6),
                      Text(
                        "${product.finalPrice.toStringAsFixed(0)} ج.م",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
