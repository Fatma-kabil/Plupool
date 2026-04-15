
import 'package:plupool/features/offers/domain/enities/offer_entity.dart';

abstract class OfferState {}

/// الحالة الابتدائية
class OfferInitial extends OfferState {}

/// تحميل (لما نجيب المنتجات)
class OfferLoading extends OfferState {}

/// تحميل خاص بالـ actions (add / update / delete)
class OfferActionLoading extends OfferState {}

/// تم تحميل المنتجات
class OfferLoaded extends OfferState {
  final List<OfferEntity> offers;

  OfferLoaded(this.offers);
}

/// نجاح عملية (إضافة / تعديل / حذف)
class OfferSuccess extends OfferState {
  final String message;

  OfferSuccess(this.message);
}

/// خطأ
class OfferError extends OfferState {
  final String message;

  OfferError(this.message);
}
class AddOfferError extends OfferState {
  final String message;

  AddOfferError(this.message);
}
 class UpdateOfferError extends OfferState {
  final String message;

  UpdateOfferError(this.message);
}
  class DeleteOfferError extends OfferState {
    final String message;
  
    DeleteOfferError(this.message);
  }