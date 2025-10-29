import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message; // ممكن تستقبلي msg من الـ backend
  const SignUpSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SignUpFailure extends SignUpState {
  final String error;
  const SignUpFailure(this.error);

  @override
  List<Object?> get props => [error];
}
