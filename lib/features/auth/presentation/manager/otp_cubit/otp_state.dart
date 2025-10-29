part of 'otp_cubit.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSentSuccess extends OtpState {}

class OtpVerifiedSuccess extends OtpState {
  final String token;
  OtpVerifiedSuccess(this.token);
}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}
