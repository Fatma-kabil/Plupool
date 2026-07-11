import 'package:bloc/bloc.dart';
import 'package:plupool/features/home/domain/params/add_support_message_params.dart';
import 'package:plupool/features/home/domain/usecases/add_support_message_uscase.dart';

part 'add_support_message_state.dart';

class AddSupportMessageCubit extends Cubit<AddSupportMessageState> {
  final AddSupportMessageUseCase addSupportMessageUseCase;

  AddSupportMessageCubit(this.addSupportMessageUseCase)
      : super(AddSupportMessageInitial());

  Future<void> addSupportMessage(
    AddSupportMessageParams params,
  ) async {
    emit(AddSupportMessageLoading());

    final result = await addSupportMessageUseCase(params);

    result.fold(
      (failure) {
        emit(AddSupportMessageError(failure.message));
      },
      (_) {
        emit(AddSupportMessageSuccess());
      },
    );
  }
}