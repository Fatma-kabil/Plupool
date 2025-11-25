import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
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
}
