import 'package:plupool/core/utils/store_filter.dart';
import 'package:plupool/features/store/presentation/data/models/product_model.dart';

class ProductFilterHelper {
  static List<ProductModel> applyFilter(
    List<ProductModel> products,
    StoreFilter filter, {
    int topCount = 3,
  }) {
    List<ProductModel> list = [...products];

    switch (filter) {
      case StoreFilter.highPrice:
        list.sort((a, b) => b.originalPrice.compareTo(a.originalPrice));
        return list.take(topCount).map((p) => p.copyWith(badge: ProductBadge.highPrice)).toList();

      case StoreFilter.lowPrice:
        list.sort((a, b) => a.originalPrice.compareTo(b.originalPrice));
        return list.take(topCount).map((p) => p.copyWith(badge: ProductBadge.lowPrice)).toList();

      case StoreFilter.bestSeller:
        list.sort((a, b) => b.salesCount.compareTo(a.salesCount));
        return list.take(topCount).map((p) => p.copyWith(badge: ProductBadge.bestSeller)).toList();

      case StoreFilter.discount:
        return list.where((p) => p.hasDiscount).map((p) => p.copyWith(badge: ProductBadge.discount)).toList();

      case StoreFilter.all:
        // خصومات
        list = list.map((p) {
          if (p.hasDiscount) return p.copyWith(badge: ProductBadge.discount);
          return p;
        }).toList();

        // الأكثر مبيعاً
        final bySales = [...list]..sort((a, b) => b.salesCount.compareTo(a.salesCount));
        for (int i = 0; i < topCount && i < bySales.length; i++) {
          final idx = list.indexOf(bySales[i]);
          if (list[idx].badge == ProductBadge.none) {
            list[idx] = list[idx].copyWith(badge: ProductBadge.bestSeller);
          }
        }

        // الأعلى سعراً
        final byHigh = [...list]..sort((a, b) => b.originalPrice.compareTo(a.originalPrice));
        for (int i = 0; i < topCount && i < byHigh.length; i++) {
          final idx = list.indexOf(byHigh[i]);
          if (list[idx].badge == ProductBadge.none) {
            list[idx] = list[idx].copyWith(badge: ProductBadge.highPrice);
          }
        }

        // الأقل سعراً
        final byLow = [...list]..sort((a, b) => a.originalPrice.compareTo(b.originalPrice));
        for (int i = 0; i < topCount && i < byLow.length; i++) {
          final idx = list.indexOf(byLow[i]);
          if (list[idx].badge == ProductBadge.none) {
            list[idx] = list[idx].copyWith(badge: ProductBadge.lowPrice);
          }
        }

        return list;
    }
  }
}
