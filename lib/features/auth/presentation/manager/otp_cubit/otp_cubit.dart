import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/auth/data/models/send_otp_respnse_model.dart';
import 'package:plupool/features/auth/domain/repos/otp_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository otpRepository;

  OtpCubit(this.otpRepository) : super(OtpInitial());
  Future<void> sendOtp(String phone) async {
    emit(OtpLoading());
    print("🟡 [Cubit] OtpLoading emitted");

    final result = await otpRepository.sendOtp(phone);

    result.fold(
      (failure) {
        print("🔴 [Cubit] OtpError emitted: ${failure.message}");
        emit(OtpError(failure.message));
      },
      (response) {
        print("🟢 [Cubit] OtpSentSuccess emitted");
        print("⏳ Expires In: ${response.expiresIn}");
        print("📲 Channels: ${response.channels}");

        emit(OtpSentSuccess(response));
      },
    );
  }
  Future<void> resendOtp(String phone) async {
  emit(OtpLoading());

  final result = await otpRepository.sendOtp(phone);

  result.fold(
    (failure) {
      emit(OtpError(failure.message));
    },
    (response) {
      emit(OtpResentSuccess(response));
    },
  );
}

  Future<void> verifyOtp(String phone, String otpCode) async {
    emit(OtpLoading());
    final result = await otpRepository.verifyOtp(phone, otpCode);
    result.fold(
      (failure) => emit(OtpError(failure.message)),
      (token) => emit(OtpVerifiedSuccess(token)),
    );
  }
}
