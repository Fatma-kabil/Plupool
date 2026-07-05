import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/consruction_service/domain/usecases/get_user_notes_usecase.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/user_notes_cubit/user_notes_state.dart';

class UserNotesCubit extends Cubit<UserNotesState> {
  UserNotesCubit(this.getUserNotesUseCase)
      : super(UserNotesInitial());

  final GetUserNotesUsecase getUserNotesUseCase;

  Future<void> getUserNotes() async {
    emit(UserNotesLoading());

    final result = await getUserNotesUseCase ();

    result.fold(
      (failure) => emit(UserNotesFailure(failure.message)),
      (userNotes) => emit(UserNotesSuccess(userNotes)),
    );
  }
}