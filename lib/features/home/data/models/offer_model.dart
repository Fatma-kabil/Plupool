class OfferModel {
  final String title;
  final String desc;
  final String? oldPrice;
  final String? newPrice;
  final String image;
  final String offerPercentage;
  final DateTime? endDate;
  final DateTime? startDate;

  const OfferModel( {
    required this.title,
    required this.desc,
    this.oldPrice,
    this.endDate,
    this.startDate, 
    this.newPrice,
    required this.image,
    required this.offerPercentage,
  });
}
