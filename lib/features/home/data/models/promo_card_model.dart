import 'dart:ui';

class PromoCardModel {
  final String iconPath;
  final String title;
  final List<String> features;
  final String buttonText;
  final VoidCallback? onButtonTap;
  final String imagePath; // صورة الموبايل

  PromoCardModel({
    required this.iconPath,
    required this.title,
    required this.features,
    required this.buttonText,
    this.onButtonTap,
    required this.imagePath,
  });
}
