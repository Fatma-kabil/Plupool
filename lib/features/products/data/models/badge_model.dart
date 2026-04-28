import 'package:plupool/features/products/domain/entities/product_entity.dart';

class BadgeModel {
  final String type;
  final String label;
  final String color;

  BadgeModel({
    required this.type,
    required this.label,
    required this.color,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      type: json['type'] ?? '',
      label: json['label'] ?? '',
      color: json['color'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'label': label,
      'color': color,
    };
  }

  Badge toEntity() {
    return Badge(
      type: type,
      label: label,
      color: color,
    );
  }
}