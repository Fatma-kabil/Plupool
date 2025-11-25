import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plupool/features/profile/domain/repos/user_repo.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  final UserRepository userRepository;

  DeleteUserCubit(this.userRepository) : super(DeleteUserInitial());

  Future<void> deleteUser(int id, String token) async {
    emit(DeleteUserLoading());
    final result = await userRepository.deleteUser(id, token);
    result.fold(
      (failure) => emit(DeleteUserError(failure.message)),
      (_) => emit(DeleteUserSuccess()),
    );
  }
}
