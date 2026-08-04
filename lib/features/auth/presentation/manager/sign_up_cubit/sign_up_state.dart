import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String token;

  const SignUpSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

class SignUpFailure extends SignUpState {
  final String error;

  const SignUpFailure(this.error);

  @override
  List<Object?> get props => [error];
}