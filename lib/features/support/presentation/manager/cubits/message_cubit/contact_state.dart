

import 'package:plupool/features/reports/domain/entities/contact_mesage_response.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final ContactMessagesResponse response;

  ContactSuccess(this.response);
}

/// تفاصيل رسالة
class ContactDetailsLoading extends ContactState {}

class ContactDetailsSuccess extends ContactState {
  final ContactMessageEntity message;

  ContactDetailsSuccess(this.message);
}

class ContactDetailsError extends ContactState {
  final String message;

  ContactDetailsError(this.message);
}

/// Delete
class ContactDeleting extends ContactState {}

class ContactDeleteSuccess extends ContactState {}

class ContactDeleteError extends ContactState {
  final String message;

  ContactDeleteError(this.message);
}

/// Update
class ContactUpdateLoading extends ContactState {}

class ContactUpdateSuccess extends ContactState {}

class ContactUpdateError extends ContactState {
  final String message;

  ContactUpdateError(this.message);
}

/// General
class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
}

class ContactCountUpdated extends ContactState {}

class ContactUsCountUpdated extends ContactState {}