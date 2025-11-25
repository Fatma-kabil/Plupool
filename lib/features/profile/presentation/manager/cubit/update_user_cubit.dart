import 'package:bloc/bloc.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';
import 'package:plupool/features/profile/domain/repos/user_repo.dart';
import 'package:plupool/features/profile/data/models/update_user_model.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final UserRepository userRepository;

  UpdateUserCubit(this.userRepository) : super(UpdateUserInitial());

  Future<void> updateUser(int id, String token, UpdateUserModel data) async {
    emit(UpdateUserLoading());

    final result = await userRepository.updateUser(id, token, data);

    result.fold(
      (failure) => emit(UpdateUserError(failure.message)),
      (user) => emit(UpdateUserSuccess(user)),
    );
  }
}
