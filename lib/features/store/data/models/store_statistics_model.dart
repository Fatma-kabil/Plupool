import 'package:plupool/features/store/domain/entities/stroe_statistics_entity.dart';

class StoreStatisticsModel extends StoreStatisticsEntity {
  // كل الداتا من API
  final Map<String, dynamic> orders;
  final Map<String, dynamic> products;
  final Map<String, dynamic> revenue;
  final Map<String, dynamic> notifications;

  StoreStatisticsModel({
    required this.orders,
    required this.products,
    required this.revenue,
    required this.notifications,
  }) : super(
          totalOrders: orders['total'] ?? 0,
          totalProducts: products['total'] ?? 0,
        );

  factory StoreStatisticsModel.fromJson(Map<String, dynamic> json) {
    return StoreStatisticsModel(
      orders: Map<String, dynamic>.from(json['orders'] ?? {}),
      products: Map<String, dynamic>.from(json['products'] ?? {}),
      revenue: Map<String, dynamic>.from(json['revenue'] ?? {}),
      notifications: Map<String, dynamic>.from(json['notifications'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders,
      'products': products,
      'revenue': revenue,
      'notifications': notifications,
    };
  }
}