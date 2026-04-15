part of 'product_offer_cubit.dart';

abstract class ProductOfferState {}

class ProductOfferInitial extends ProductOfferState {}

class ProductOfferLoading extends ProductOfferState {}
class ProductOfferSuccess extends ProductOfferState {}

class GetProductOfferSuccess extends ProductOfferState {
   final List<Product> offers;

 GetProductOfferSuccess(this.offers);
}

class ProductOfferError extends ProductOfferState {
  final String message;

  ProductOfferError(this.message);
}


class AddProductOfferError extends ProductOfferState {
  final String message;

  AddProductOfferError(this.message);
}

class EditProductOfferError extends ProductOfferState {
  final String message;

  EditProductOfferError(this.message);
}

class DeleteProductOfferError extends ProductOfferState {
  final String message;

  DeleteProductOfferError(this.message);
}