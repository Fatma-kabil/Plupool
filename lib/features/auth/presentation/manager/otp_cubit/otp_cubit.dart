import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/auth/domain/repos/otp_repo.dart';


part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepository otpRepository;

  OtpCubit(this.otpRepository) : super(OtpInitial());

  Future<void> sendOtp(String phone) async {
    emit(OtpLoading());
    final result = await otpRepository.sendOtp(phone);
    result.fold(
      (failure) => emit(OtpError(failure.message)),
      (_) => emit(OtpSentSuccess()),
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
