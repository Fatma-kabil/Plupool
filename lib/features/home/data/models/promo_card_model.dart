import 'dart:ui';

class PromoCardModel {
  final String iconPath;
  final String title;
  final List<String> features;
  final Color textcolor;
   final Color titlecolor;
  final Color cardcolor;
  final VoidCallback? onButtonTap;
  final String imagePath; // صورة الموبايل

  PromoCardModel({
    required this.cardcolor,
    required this.iconPath,
    required this.title,
    required this.features,
    required this.textcolor,
    required this.titlecolor,
    this.onButtonTap,
    required this.imagePath,
  });
}
