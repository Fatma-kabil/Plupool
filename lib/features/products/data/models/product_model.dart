import 'package:plupool/features/products/domain/entities/product_entity.dart';

enum ProductBadge { discount, bestSeller, highPrice, lowPrice, none }

class ProductModel extends Product {
  final int id;
  final String name;
  final String image;
  final double originalPrice; // 👈 السعر الأصلي
  final int salesCount;
  final double discountPercent; // 👈 نسبة الخصم (0 يعني مفيش خصم)
  final ProductBadge badge;
  final int stock;
  final String? category;
  final DateTime? startDate;
  final DateTime? endDate;

  ProductModel({
  this.startDate,
  this.endDate,
  this.category,
  required this.id,
  required this.stock,
  required this.name,
  required this.image,
  required this.originalPrice,
  required this.salesCount,
  this.discountPercent = 0,
  this.badge = ProductBadge.none,
}) : super(
        id: id,
        name: name,
        image: image,
      );
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
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ProductModel(
      id: id ,
      startDate: startDate?? this.startDate,
      endDate: endDate?? this.endDate,
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
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      originalPrice: (json['original_price'] ?? 0).toDouble(),
      salesCount: json['sales_count'] ?? 0,
      discountPercent: (json['discount_percent'] ?? 0).toDouble(),
      badge: _badgeFromString(json['badge']),
      stock: json['stock'] ?? 0,
      category: json['category'],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
    );
  }

  /// =========================
  /// ✅ toJson
  /// =========================
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "original_price": originalPrice,
      "sales_count": salesCount,
      "discount_percent": discountPercent,
      "badge": _badgeToString(badge),
      "stock": stock,
      "category": category,
      "start_date": startDate?.toIso8601String(),
      "end_date": endDate?.toIso8601String(),
    };
  }

  /// =========================
  /// 🔁 Enum Helpers
  /// =========================
  static ProductBadge _badgeFromString(String? value) {
    switch (value) {
      case 'discount':
        return ProductBadge.discount;
      case 'best_seller':
        return ProductBadge.bestSeller;
      case 'high_price':
        return ProductBadge.highPrice;
      case 'low_price':
        return ProductBadge.lowPrice;
      default:
        return ProductBadge.none;
    }
  }

  static String _badgeToString(ProductBadge badge) {
    switch (badge) {
      case ProductBadge.discount:
        return 'discount';
      case ProductBadge.bestSeller:
        return 'best_seller';
      case ProductBadge.highPrice:
        return 'high_price';
      case ProductBadge.lowPrice:
        return 'low_price';
      case ProductBadge.none:
        return 'none';
    }
  }
}