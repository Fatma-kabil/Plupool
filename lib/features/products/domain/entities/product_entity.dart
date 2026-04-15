import 'dart:io';

class Product {
  final int? id;
  final File? image;
  final String name;
  final int categoryId;
  final int price;
  final int stock;
  final String? imageUrl;
  final String? stockStatus;
  final double? discountValue;
  final bool? hasOffer;
  final DateTime? offerStartDate;
  final DateTime? offerEndDate;

  Product({
    this.offerStartDate,
    this.offerEndDate,
    this.discountValue,
    this.imageUrl,
    this.id,
     this.hasOffer,
    this.stockStatus,
    required this.image,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.stock,
  });
}
