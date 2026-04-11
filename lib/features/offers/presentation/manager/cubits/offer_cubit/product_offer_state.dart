part of 'product_offer_cubit.dart';

abstract class ProductOfferState {}

class ProductOfferInitial extends ProductOfferState {}

class ProductOfferLoading extends ProductOfferState {}

class ProductOfferSuccess extends ProductOfferState {}

class ProductOfferError extends ProductOfferState {
  final String message;

  ProductOfferError(this.message);
}