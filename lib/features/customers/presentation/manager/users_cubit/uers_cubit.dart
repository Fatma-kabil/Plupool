import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/customers/domain/entities/user_response_entity.dart';
import 'package:plupool/features/customers/domain/usecases/add_user_usecase.dart';
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
  final AddUserUsecase addUserUseCase;

  UsersCubit(
    this.getUsersUseCase,
    this.addUserUseCase, {
    required this.getUserDetailsUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  }) : super(UsersInitial());

  // =========================================================
  // CACHE
  // =========================================================

  UsersResponseEntity? _cachedUsers;

  /// الداتا الخاصة بالـ technicians بدون Search أو Filter
  /// دي اللي هنستخدمها للهيدر
  UsersResponseEntity? _cachedTechnicians;

  // =========================================================
  // CURRENT FILTERS
  // =========================================================

  String? _search;
  String? _role;
  bool? _isActive;
  bool? _isVerified;
  String? _sortBy;
  String? _sortOrder;

  // =========================================================
  // GET USERS
  // =========================================================

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
      // حفظ الفلاتر الحالية
      _search = search;
      _role = role;
      _isActive = isActive;
      _isVerified = isVerified;
      _sortBy = sortBy;
      _sortOrder = sortOrder;

      // =====================================================
      // الداتا الخاصة بالليست
      // =====================================================

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

      _cachedUsers = response;

      // =====================================================
      // لو Technicians
      // هات الداتا بدون Search وبدون Filter للهيدر
      // =====================================================

      if (role == "technician") {
        final headerResponse = await getUsersUseCase(
          role: "technician",
          sortBy: "created_at",
          sortOrder: "desc",
        );

        _cachedTechnicians = headerResponse;
      }

      // =====================================================
      // SUCCESS
      // =====================================================

      emit(
        UsersSuccess(
          response.users,

          // الهيدر ياخد الإجمالي الحقيقي
          activeTech: role == "technician"
              ? _cachedTechnicians?.activeTech ?? 0
              : response.activeTech,

          inActiveTech: role == "technician"
              ? _cachedTechnicians?.inactiveTeck ?? 0
              : response.inactiveTeck,
        ),
      );
    } catch (e) {
      emit(
        UsersError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء جلب المستخدمين",
        ),
      );

      print(e);
    }
  }

  // =========================================================
  // GET USER DETAILS
  // =========================================================

  Future<void> getUserDetails(int id) async {
    try {
      emit(UserDetailsLoading());

      final user = await getUserDetailsUseCase(id);

      emit(UserDetailsSuccess(user));
    } catch (e) {
      emit(
        UserDetailsError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء جلب تفاصيل المستخدم",
        ),
      );

      if (_cachedUsers != null) {
        emit(
          UsersSuccess(
            _cachedUsers!.users,
            activeTech: _role == "technician"
                ? _cachedTechnicians?.activeTech ?? 0
                : _cachedUsers!.activeTech,
            inActiveTech: _role == "technician"
                ? _cachedTechnicians?.inactiveTeck ?? 0
                : _cachedUsers!.inactiveTeck,
          ),
        );
      }
    }
  }

  // =========================================================
  // ADD USER
  // =========================================================

  Future<void> addUser({
    String? fullName,
    String? phone,
    String? countryCode,
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

      // إضافة المستخدم
      await addUserUseCase(
        fullName: fullName,
        companyName: companyName,
        phone: phone,
        countryCode: countryCode,
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

      // =====================================================
      // تحديث الليست بنفس الـ Search / Filter الحالي
      // =====================================================

      final response = await getUsersUseCase(
        search: _search,
        role: _role,
        isActive: _isActive,
        isVerified: _isVerified,
        sortBy: _sortBy ?? "created_at",
        sortOrder: _sortOrder ?? "desc",
      );

      _cachedUsers = response;

      // =====================================================
      // تحديث بيانات الهيدر بشكل مستقل
      // بدون Search / Filter
      // =====================================================

      if (_role == "technician") {
        final headerResponse = await getUsersUseCase(
          role: "technician",
          sortBy: "created_at",
          sortOrder: "desc",
        );

        _cachedTechnicians = headerResponse;
      }

      // نجاح الإضافة
      emit(UsersActionSuccess());

      // رجع الليست + الهيدر الجديد
      emit(
        UsersSuccess(
          response.users,
          activeTech: _role == "technician"
              ? _cachedTechnicians?.activeTech ?? 0
              : response.activeTech,
          inActiveTech: _role == "technician"
              ? _cachedTechnicians?.inactiveTeck ?? 0
              : response.inactiveTeck,
        ),
      );
    } catch (e) {
      emit(
        UsersActionError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء إضافة المستخدم",
        ),
      );

      print(e);

      if (_cachedUsers != null) {
        emit(
          UsersSuccess(
            _cachedUsers!.users,
            activeTech: _role == "technician"
                ? _cachedTechnicians?.activeTech ?? 0
                : _cachedUsers!.activeTech,
            inActiveTech: _role == "technician"
                ? _cachedTechnicians?.inactiveTeck ?? 0
                : _cachedUsers!.inactiveTeck,
          ),
        );
      }
    }
  }

  // =========================================================
  // UPDATE USER
  // =========================================================

  Future<void> updateUser({
    required int userId,
    String? fullName,
    String? phone,
    String? countryCode,
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
        phone: phone,
        countryCode: countryCode,
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

      // تحديث الليست
      final response = await getUsersUseCase(
        search: _search,
        role: _role,
        isActive: _isActive,
        isVerified: _isVerified,
        sortBy: _sortBy ?? "created_at",
        sortOrder: _sortOrder ?? "desc",
      );

      _cachedUsers = response;

      // تحديث الهيدر
      if (_role == "technician") {
        final headerResponse = await getUsersUseCase(
          role: "technician",
          sortBy: "created_at",
          sortOrder: "desc",
        );

        _cachedTechnicians = headerResponse;
      }

      emit(UsersActionSuccess());

      emit(
        UsersSuccess(
          response.users,
          activeTech: _role == "technician"
              ? _cachedTechnicians?.activeTech ?? 0
              : response.activeTech,
          inActiveTech: _role == "technician"
              ? _cachedTechnicians?.inactiveTeck ?? 0
              : response.inactiveTeck,
        ),
      );
    } catch (e) {
      emit(
        UsersActionError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء تحديث المستخدم",
        ),
      );

      print(e);

      if (_cachedUsers != null) {
        emit(
          UsersSuccess(
            _cachedUsers!.users,
            activeTech: _role == "technician"
                ? _cachedTechnicians?.activeTech ?? 0
                : _cachedUsers!.activeTech,
            inActiveTech: _role == "technician"
                ? _cachedTechnicians?.inactiveTeck ?? 0
                : _cachedUsers!.inactiveTeck,
          ),
        );
      }
    }
  }

  // =========================================================
  // DELETE USER
  // =========================================================

  Future<void> deleteUser(int id) async {
    try {
      emit(UsersDeleting());

      await deleteUserUseCase(id);

      // =====================================================
      // بعد الحذف هنعمل GET جديد
      // عشان الليست والهيدر يتحدثوا صح
      // =====================================================

      final response = await getUsersUseCase(
        search: _search,
        role: _role,
        isActive: _isActive,
        isVerified: _isVerified,
        sortBy: _sortBy ?? "created_at",
        sortOrder: _sortOrder ?? "desc",
      );

      _cachedUsers = response;

      // تحديث الهيدر بشكل مستقل
      if (_role == "technician") {
        final headerResponse = await getUsersUseCase(
          role: "technician",
          sortBy: "created_at",
          sortOrder: "desc",
        );

        _cachedTechnicians = headerResponse;
      }

      emit(UsersDeleteSuccess());

      emit(
        UsersSuccess(
          response.users,
          activeTech: _role == "technician"
              ? _cachedTechnicians?.activeTech ?? 0
              : response.activeTech,
          inActiveTech: _role == "technician"
              ? _cachedTechnicians?.inactiveTeck ?? 0
              : response.inactiveTeck,
        ),
      );
    } catch (e) {
      emit(
        UsersDeleteError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء حذف المستخدم",
        ),
      );

      print(e);

      if (_cachedUsers != null) {
        emit(
          UsersSuccess(
            _cachedUsers!.users,
            activeTech: _role == "technician"
                ? _cachedTechnicians?.activeTech ?? 0
                : _cachedUsers!.activeTech,
            inActiveTech: _role == "technician"
                ? _cachedTechnicians?.inactiveTeck ?? 0
                : _cachedUsers!.inactiveTeck,
          ),
        );
      }
    }
  }

  // =========================================================
  // REFRESH
  // =========================================================

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