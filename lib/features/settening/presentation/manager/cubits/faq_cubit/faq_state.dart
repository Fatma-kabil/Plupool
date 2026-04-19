import 'package:plupool/features/settening/domain/entities/faq_entity.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

/// 🔵 Loading عام
class FaqLoading extends FaqState {}

/// 🔵 تحميل list
class FaqSuccess extends FaqState {
  final List<FaqEntity> faqs;

  FaqSuccess(this.faqs);
}

/// 🔵 تحميل عنصر واحد
class FaqSingleLoaded extends FaqState {
  final FaqEntity faq;

  FaqSingleLoaded(this.faq);
}

/// ➕ Create success
class FaqCreated extends FaqState {}

/// 🗑 Delete success
class FaqDeleted extends FaqState {}

/// 👁 Toggle success
class FaqToggled extends FaqState {
  final FaqEntity faq;

  FaqToggled(this.faq);
}

/// 🔴 Error
class FaqError extends FaqState {
  final String message;

  FaqError(this.message);
}