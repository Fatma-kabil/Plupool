part of 'add_support_message_cubit.dart';

abstract class AddSupportMessageState {}

class AddSupportMessageInitial extends AddSupportMessageState {}

class AddSupportMessageLoading extends AddSupportMessageState {}

class AddSupportMessageSuccess extends AddSupportMessageState {}

class AddSupportMessageError extends AddSupportMessageState {
  final String message;

  AddSupportMessageError(this.message);
}