import 'package:plupool/features/store/domain/entities/stroe_statistics_entity.dart';

class StoreStatisticsModel extends StoreStatisticsEntity {
  // كل الداتا من API
  final Map<String, dynamic> orders;
  final Map<String, dynamic> products;
  final Map<String, dynamic> revenue;
  final Map<String, dynamic> notifications;
  final Map<String, dynamic> offers;
  final Map<String, dynamic> ratings;

  StoreStatisticsModel({
    required this.orders,
    required this.products,
    required this.revenue,
    required this.notifications,
    required this.offers,
    required this.ratings,
  }) : super(
         rating: ratings['total'] ?? 0.0,
         totalOrders: orders['total'] ?? 0,
         totalProducts: products['total'] ?? 0,
         activeOffers: offers['active'] ?? 0,
       );

  factory StoreStatisticsModel.fromJson(Map<String, dynamic> json) {
    return StoreStatisticsModel(
      ratings: Map<String, dynamic>.from(json['ratings'] ?? {}),
      orders: Map<String, dynamic>.from(json['orders'] ?? {}),
      products: Map<String, dynamic>.from(json['products'] ?? {}),
      revenue: Map<String, dynamic>.from(json['revenue'] ?? {}),
      notifications: Map<String, dynamic>.from(json['notifications'] ?? {}),
      offers: Map<String, dynamic>.from(json['offers'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ratings': ratings,
      'orders': orders,
      'products': products,
      'revenue': revenue,
      'notifications': notifications,
      'offers': offers,
    };
  }
}
