import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/select_role/domain/entities/role_entity.dart';
import 'package:plupool/features/select_role/domain/usecases/get_saved_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/save_role_usecase.dart';

part 'select_role_state.dart';

class SelectRoleCubit extends Cubit<SelectRoleState> {
  final SaveRoleUseCase saveRoleUseCase;
  final GetSavedRoleUseCase getSavedRoleUseCase;

  SelectRoleCubit( {
  required this.saveRoleUseCase,
    required this.getSavedRoleUseCase,
  }) : super(SelectRoleInitial());

  Future<void> saveSelectedRole(String roleName) async {
    emit(SaveRoleLoading());
    try {
      await saveRoleUseCase(RoleEntity(roleName));
      emit(SaveRoleSuccess());
    } catch (e) {
      emit(SaveRoleError(e.toString()));
    }
  }

  Future<void> getSavedRole() async {
    emit(GetRoleLoading());
    try {
      final role = await getSavedRoleUseCase();
      if (role != null) {
        emit(GetRoleSuccess(role.name));
      } else {
        emit(GetRoleEmpty());
      }
    } catch (e) {
      emit(GetRoleError(e.toString()));
    }
  }
}
