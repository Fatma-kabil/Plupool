class ProductOfferEntity {
  final int id;
  final String discountType;
  final double discountValue;
  final String offerBadge;
  final DateTime offerStartDate;
  final DateTime offerEndDate;
  final bool? isFeatured;

  ProductOfferEntity({
    required this.id,
    required this.discountType,
    required this.discountValue,
    required this.offerBadge,
    required this.offerStartDate,
    required this.offerEndDate,
     this.isFeatured,
  });
}
