class OfferModel {
  final String title;
  final String desc;
  final String oldPrice;
  final String newPrice;
  final String image;
  final String offerPercentage;

  const OfferModel({
    required this.title,
    required this.desc,
    required this.oldPrice,
    required this.newPrice,
    required this.image,
    required this.offerPercentage,
  });
}
