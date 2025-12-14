import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';
import 'package:plupool/features/profile/domain/repos/user_repo.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> fetchCurrentUser(String token) async {
    emit(UserLoading());

    final failureOrUser = await userRepository.getCurrentUser(token);

    failureOrUser.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
   Future<void> updateUser(int id, String token, UpdateUserModel data) async {
    emit(UpdateUserLoading());

    final result = await userRepository.updateUser(id, token, data);

    result.fold(
      (failure) => emit(UpdateUserError(failure.message)),
      (user) => emit(UpdateUserSuccess(user)),
    );
  }
   Future<void> deleteUser(int id, String token) async {
    emit(DeleteUserLoading());
    final result = await userRepository.deleteUser(id, token);
    result.fold(
      (failure) => emit(DeleteUserError(failure.message)),
      (_) => emit(DeleteUserSuccess()),
    );
  }
}
