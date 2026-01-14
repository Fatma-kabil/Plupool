

import 'package:plupool/features/store/data/models/product_model.dart';

String? getBadgeText(ProductModel product) {
  switch (product.badge) {
    case ProductBadge.discount:
      return "خصم ${product.discountPercent.toInt()}%";
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
