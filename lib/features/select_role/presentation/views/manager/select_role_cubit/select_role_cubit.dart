import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/select_role/domain/entities/role_entity.dart';
import 'package:plupool/features/select_role/domain/usecases/get_saved_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/save_role_usecase.dart';
import 'package:plupool/features/select_role/domain/usecases/delete_saved_role_usecase.dart';

part 'select_role_state.dart';

class SelectRoleCubit extends Cubit<SelectRoleState> {
  final SaveRoleUseCase saveRoleUseCase;
  final GetSavedRoleUseCase getSavedRoleUseCase;
  final DeleteSavedRoleUseCase deleteSavedRoleUseCase;

  SelectRoleCubit({
    required this.saveRoleUseCase,
    required this.getSavedRoleUseCase,
    required this.deleteSavedRoleUseCase,
  }) : super(SelectRoleInitial());

  /// حفظ الـ Role
  Future<void> saveSelectedRole(String roleName) async {
    emit(SaveRoleLoading());

    try {
      await saveRoleUseCase(
        RoleEntity(roleName),
      );

      emit(SaveRoleSuccess());
    } catch (e) {
      emit(
        SaveRoleError(e.toString()),
      );
    }
  }

  /// جلب الـ Role المحفوظ
  Future<void> getSavedRole() async {
    emit(GetRoleLoading());

    try {
      final role = await getSavedRoleUseCase();

      print("🎯 role from usecase: $role");

      if (role != null) {
        emit(
          GetRoleSuccess(role.name),
        );
      } else {
        emit(GetRoleEmpty());
      }
    } catch (e) {
      print('🔥 getSavedRole error: $e');

      emit(
        GetRoleError(e.toString()),
      );
    }
  }

  /// حذف الـ Role بعد حذف الحساب
  Future<void> deleteSavedRole() async {
    try {
      await deleteSavedRoleUseCase();

      print('🗑️ Saved role deleted successfully');

      emit(GetRoleEmpty());
    } catch (e) {
      print('🔥 deleteSavedRole error: $e');

      emit(
        GetRoleError(e.toString()),
      );
    }
  }
}