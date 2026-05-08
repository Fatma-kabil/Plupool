// users_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/error/failure.dart';

import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/domain/usecases/delete_user_usecase.dart';
import 'package:plupool/features/customers/domain/usecases/get_user_details_usecase.dart';
import 'package:plupool/features/customers/domain/usecases/get_users_usecase.dart';
import 'package:plupool/features/customers/domain/usecases/update_user_usecase.dart';

import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsersUseCase getUsersUseCase;
  final GetUserDetailsUseCase getUserDetailsUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  UsersCubit(
    this.getUsersUseCase, {
    required this.getUserDetailsUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  }) : super(UsersInitial());

  /// =========================
  /// CACHE
  /// =========================

  List<UserEntity> _cachedUsers = [];

  /// =========================
  /// FILTERS
  /// =========================

  String? _search;
  String? _role;
  bool? _isActive;
  bool? _isVerified;
  String? _sortBy;
  String? _sortOrder;

  /// =========================
  /// GET USERS
  /// =========================

  Future<void> getUsers({
    int page = 1,
    int pageSize = 50,
    String? search,
    String? role,
    bool? isActive,
    bool? isVerified,
    String sortBy = "created_at",
    String sortOrder = "desc",
  }) async {
    emit(UsersLoading());

    try {
      _search = search;
      _role = role;
      _isActive = isActive;
      _isVerified = isVerified;
      _sortBy = sortBy;
      _sortOrder = sortOrder;

      final response = await getUsersUseCase(
        page: page,
        pageSize: pageSize,
        search: search,
        role: role,
        isActive: isActive,
        isVerified: isVerified,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      _cachedUsers = response.users;

      emit(UsersSuccess(response.users));
    } catch (e) {
      emit(
        UsersError(e is Failure ? e.message : "حدث خطأ أثناء جلب المستخدمين"),
      
      );
        print(e);
    }
  }

  /// =========================
  /// GET USER DETAILS
  /// =========================

  Future<void> getUserDetails(int id) async {
    try {
      emit(UserDetailsLoading());

      final user = await getUserDetailsUseCase(id);

      emit(UserDetailsSuccess(user));
    } catch (e) {
      emit(
        UserDetailsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب تفاصيل المستخدم",
        ),
      );

      if (_cachedUsers.isNotEmpty) {
        emit(UsersSuccess(_cachedUsers));
      }
    }
  }

  /// =========================
  /// UPDATE USER
  /// =========================

  Future<void> updateUser({
    required int userId,
    String? fullName,
    String? companyName,
    String? role,
    double? latitude,
    double? longitude,
    String? address,
    String? skills,
    int? yearsOfExperience,
    bool? isActive,
    bool? isApproved,
    bool? isPhoneVerified,
  }) async {
    try {
      emit(UsersActionLoading());

      await updateUserUseCase(
        userId: userId,
        fullName: fullName,
        companyName: companyName,
        role: role,
        latitude: latitude,
        longitude: longitude,
        address: address,
        skills: skills,
        yearsOfExperience: yearsOfExperience,
        isActive: isActive,
        isApproved: isApproved,
        isPhoneVerified: isPhoneVerified,
      );

      final response = await getUsersUseCase(
        search: _search,
        role: _role,
        isActive: _isActive,
        isVerified: _isVerified,
        sortBy: _sortBy ?? "created_at",
        sortOrder: _sortOrder ?? "desc",
      );

      _cachedUsers = response.users;

      emit(UsersActionSuccess());
      emit(UsersSuccess(response.users));
    } catch (e) {
      emit(
        UsersActionError(
          e is Failure ? e.message : "حدث خطأ أثناء تحديث المستخدم",
        ),
      );

      emit(UsersSuccess(_cachedUsers));
    }
  }

  /// =========================
  /// DELETE USER
  /// =========================

  Future<void> deleteUser(int id) async {
    try {
      emit(UsersDeleting());

      await deleteUserUseCase(id);

      _cachedUsers.removeWhere((e) => e.id == id);

      emit(UsersDeleteSuccess());
      emit(UsersSuccess(_cachedUsers));
    } catch (e) {
      emit(
        UsersDeleteError(
          e is Failure ? e.message : "حدث خطأ أثناء حذف المستخدم",
        ),
      );

      emit(UsersSuccess(_cachedUsers));
    }
  }

  /// =========================
  /// REFRESH
  /// =========================

  Future<void> refresh() async {
    await getUsers(
      search: _search,
      role: _role,
      isActive: _isActive,
      isVerified: _isVerified,
      sortBy: _sortBy ?? "created_at",
      sortOrder: _sortOrder ?? "desc",
    );
  }
}
