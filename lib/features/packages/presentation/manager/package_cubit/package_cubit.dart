import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/packages/domain/entities/package_entity.dart';
import 'package:plupool/features/packages/domain/entities/packages_response_entity.dart';
import 'package:plupool/features/packages/domain/usecases/add_package_visit_usecase.dart';
import 'package:plupool/features/packages/domain/usecases/get_package_details_usecase.dart';
import 'package:plupool/features/packages/domain/usecases/get_packages_usecase.dart';
import 'package:plupool/features/packages/domain/usecases/update_package_progress_usecase.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final GetPackagesUseCase getPackagesUseCase;
  final GetPackageDetailsUseCase getPackageDetailsUseCase;
  final UpdatePackageProgressUseCase updateProgressUseCase;
  final AddPackageVisitUseCase addVisitUseCase;

  PackagesCubit(
    this.getPackagesUseCase, {
    required this.getPackageDetailsUseCase,
    required this.updateProgressUseCase,
    required this.addVisitUseCase,
  }) : super(PackagesInitial());

  /// 🧠 cache
  List<PackageEntity> _cachedPackages = [];

  /// 📊 filters
  String? _status;
  String? _duration;
  String? _search;

  /// 📦 full response cache (important for stats)
  PackagesResponseEntity? _cachedResponse;

  // =========================
  // 📋 GET PACKAGES
  // =========================
  Future<void> getPackages({
    String? status,
    String? duration,
    String? search,
  }) async {
    emit(PackagesLoading());

    try {
      _status = status;
      _duration = duration;
      _search = search;

      final response = await getPackagesUseCase(
        status: status,
        duration: duration,
        search: search,
      );

      _cachedResponse = response;
      _cachedPackages = response.packages;

      emit(PackagesSuccess(response));
    } catch (e) {
      emit(
        PackagesError(e is Failure ? e.message : "حدث خطأ أثناء جلب الباقات"),
      );
    }
  }

  // =========================
  // 📄 PACKAGE DETAILS
  // =========================
  Future<void> getPackageDetails(int id) async {
    try {
      emit(PackageDetailsLoading());

      final package = await getPackageDetailsUseCase(id);

      emit(PackageDetailsSuccess(package));
    } catch (e) {
      emit(
        PackageDetailsError(
          e is Failure ? e.message : "حدث خطأ أثناء جلب تفاصيل الباقة",
        ),
      );

      /// rollback لو عندك cache
      if (_cachedPackages.isNotEmpty && _cachedResponse != null) {
        emit(PackagesSuccess(_cachedResponse!));
      }
    }
  }

  // =========================
  // ✏️ UPDATE PROGRESS
  // =========================
  Future<void> updateProgress({
    required int packageId,
    required int bookingId,
    String? status,
    DateTime? nextDate,
    String? notes,
  }) async {
    try {
      emit(PackagesActionLoading());

      await updateProgressUseCase(
        packageId: packageId,
        bookingId: bookingId,
        status: status,
        nextDate: nextDate,
        notes: notes,
      );

      final response = await getPackagesUseCase(
        status: _status,
        duration: _duration,
        search: _search,
      );

      _cachedResponse = response;
      _cachedPackages = response.packages;

      emit(PackagesActionSuccess());
      emit(PackagesSuccess(response));
    } catch (e) {
      emit(
        PackagesActionError(
          e is Failure ? e.message : "حدث خطأ أثناء تحديث حالة الباقة",
        ),
      );

      /// rollback
      if (_cachedResponse != null) {
        emit(PackagesSuccess(_cachedResponse!));
      }
    }
  }

  // =========================
  // ➕ ADD VISIT
  // =========================
  Future<void> addVisit({
    required int packageId,
    required int userId,
    required String date,
    required String time,
    String? notes,
  }) async {
    try {
      emit(PackagesActionLoading());

      await addVisitUseCase(
        packageId: packageId,
        userId: userId,
        date: date,
        time: time,
        notes: notes,
      );

      final response = await getPackagesUseCase(
        status: _status,
        duration: _duration,
        search: _search,
      );

      _cachedResponse = response;
      _cachedPackages = response.packages;

      emit(PackagesActionSuccess());
      emit(PackagesSuccess(response));
    } catch (e) {
      emit(
        PackagesActionError(
          e is Failure ? e.message : "حدث خطأ أثناء إضافة زيارة",
        ),
      );

      if (_cachedResponse != null) {
        emit(PackagesSuccess(_cachedResponse!));
      }
    }
  }

  // =========================
  // 🔄 REFRESH
  // =========================
  Future<void> refresh() async {
    await getPackages(status: _status, duration: _duration, search: _search);
  }

  // =========================
  // 🧠 GETTERS (for UI)
  // =========================

  List<PackageEntity> get cachedPackages => _cachedPackages;

  PackagesResponseEntity? get cachedResponse => _cachedResponse;

  int get inProgressCount => _cachedResponse?.stats.inProgress ?? 0;

  int get completedCount => _cachedResponse?.stats.completed ?? 0;

  int get scheduledCount => _cachedResponse?.stats.scheduled ?? 0;
}
