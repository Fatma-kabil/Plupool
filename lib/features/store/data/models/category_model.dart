import '../../domain/entities/category_entity.dart';

class CategoryModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String icon;
  final bool isActive;

  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.isActive,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      icon: json['icon'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: nameAr,
      icon: icon,
    );
  }
}