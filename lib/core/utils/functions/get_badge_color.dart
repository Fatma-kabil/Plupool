import 'package:flutter/material.dart';
import 'package:plupool/features/store/data/models/product_model.dart';

Color getBadgeColor(ProductBadge badge) {
  switch (badge) {
    case ProductBadge.discount:
      return Colors.red;
    case ProductBadge.bestSeller:
      return Colors.green;
    case ProductBadge.highPrice:
      return Colors.blue;
    case ProductBadge.lowPrice:
      return Colors.orange;
    case ProductBadge.none:
      return Colors.transparent;
  }
}
