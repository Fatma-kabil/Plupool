class ProductOfferEntity {
  final int id;
  final String productName;
  final DateTime startOffer;
  final DateTime endOffer;
  final double offervalue;

  ProductOfferEntity({required this.id, required this.productName, required this.startOffer, required this.endOffer, required this.offervalue});
}
