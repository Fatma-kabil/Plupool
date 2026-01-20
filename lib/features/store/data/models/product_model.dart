enum ProductBadge { discount, bestSeller, highPrice, lowPrice, none }

class ProductModel {
  final String name;
  final String image;
  final double originalPrice; // 👈 السعر الأصلي
  final int salesCount;
  final double discountPercent; // 👈 نسبة الخصم (0 يعني مفيش خصم)
  final ProductBadge badge;
  final int stock;
  final String? category;

  const ProductModel({
    this.category,
    required this.stock,
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.salesCount,
    this.discountPercent = 0,
    this.badge = ProductBadge.none,
  });

  /// 👇 السعر بعد الخصم
  double get finalPrice {
    if (discountPercent > 0) {
      return originalPrice - (originalPrice * discountPercent / 100);
    }
    return originalPrice;
  }

  bool get hasDiscount => discountPercent > 0;

  ProductModel copyWith({
    String? name,
    String? image,
    double? originalPrice,
    int? salesCount,
    double? discountPercent,
    ProductBadge? badge,
    int? stock,
    String? category,
  }) {
    return ProductModel(
      category: category ?? this.category,
      stock: stock ?? this.stock,
      name: name ?? this.name,
      image: image ?? this.image,
      originalPrice: originalPrice ?? this.originalPrice,
      salesCount: salesCount ?? this.salesCount,
      discountPercent: discountPercent ?? this.discountPercent,
      badge: badge ?? this.badge,
    );
  }
}
