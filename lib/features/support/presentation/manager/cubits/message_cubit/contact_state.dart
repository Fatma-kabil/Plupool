import 'package:plupool/features/support/domain/entities/contact_entity.dart';





abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final List<ContactEntity> messages;

  ContactSuccess(this.messages);
}

class ContactActionSuccess extends ContactState {}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
}
class ContactDeleting extends ContactState {}
class ContactDeleteSuccess extends ContactState {}

class ContactDeleteError extends ContactState {
  final String message;

  ContactDeleteError(this.message);
}

class ContactUpdateError extends ContactState {
  final String message;

  ContactUpdateError(this.message);
}