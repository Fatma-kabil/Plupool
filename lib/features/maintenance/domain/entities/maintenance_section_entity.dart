class MaintenanceSectionEntity {
  final int id;
  final String titleAr;
  final String titleEn;
  final String imageUrl;
  final String icon;
  final List<String> features;

  const MaintenanceSectionEntity({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.imageUrl,
    required this.icon,
    required this.features,
  });
}