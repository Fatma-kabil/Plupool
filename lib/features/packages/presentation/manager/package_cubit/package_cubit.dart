import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/error/failure.dart';

import 'package:plupool/features/packages/data/models/create_package_request.dart';
import 'package:plupool/features/packages/data/models/update_package_request.dart';

import 'package:plupool/features/packages/domain/entities/package_entity.dart';
import 'package:plupool/features/packages/domain/entities/packages_response_entity.dart';

import 'package:plupool/features/packages/domain/usecases/create_package_usecase.dart';
import 'package:plupool/features/packages/domain/usecases/decrease_package_progress.dart';
import 'package:plupool/features/packages/domain/usecases/get_package_details_usecase.dart';
import 'package:plupool/features/packages/domain/usecases/get_packages_usecase.dart';
import 'package:plupool/features/packages/domain/usecases/increase_package_progress.dart';
import 'package:plupool/features/packages/domain/usecases/update_package_usecase.dart';

import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  // =========================
  // USE CASES
  // =========================

  final GetPackagesUseCase getPackagesUseCase;
  final GetPackageDetailsUseCase getPackageDetailsUseCase;
  final CreatePackageUseCase createPackageUseCase;
final UpdatePackageUseCase updatePackageUseCase;
  final IncreasePackageProgress increasePackageProgressUseCase;
  final DecreasePackageProgress decreasePackageProgressUseCase;

  PackagesCubit(
    this.getPackagesUseCase, {
    required this.getPackageDetailsUseCase,
    required this.createPackageUseCase,
    required this.increasePackageProgressUseCase,
    required this.decreasePackageProgressUseCase,
    required this.updatePackageUseCase,
  }) : super(PackagesInitial());

  // =========================
  // 🧠 CACHE
  // =========================

  List<PackageEntity> _cachedPackages = [];

  PackagesResponseEntity? _cachedResponse;

  // =========================
  // 📊 CURRENT FILTERS
  // =========================

  String? _status;
  String? _duration;
  String? _search;

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
      // حفظ الفلاتر الحالية
      _status = status;
      _duration = duration;
      _search = search;

      print("=================================");
      print("📦 GET PACKAGES");
      print("status = $status");
      print("duration = $duration");
      print("search = $search");
      print("=================================");

      final response = await getPackagesUseCase(
        status: status,
        duration: duration,
        search: search,
      );

      // تحديث الـ cache
      _cachedResponse = response;
      _cachedPackages = response.packages;

      emit(
        PackagesSuccess(response),
      );
    } catch (e) {
      print("❌ GET PACKAGES ERROR: $e");

      emit(
        PackagesError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء جلب الباقات",
        ),
      );
    }
  }

  // =========================
  // 📄 PACKAGE DETAILS
  // =========================

  Future<void> getPackageDetails(int id) async {
    try {
      emit(PackageDetailsLoading());

      print("=================================");
      print("📄 GET PACKAGE DETAILS");
      print("packageId = $id");
      print("=================================");

      final package = await getPackageDetailsUseCase(id);

      emit(
        PackageDetailsSuccess(package),
      );
    } catch (e) {
      print(
        "❌ GET PACKAGE DETAILS ERROR: $e",
      );

      emit(
        PackageDetailsError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء جلب تفاصيل الباقة",
        ),
      );

      // رجوع للبيانات القديمة
      if (_cachedPackages.isNotEmpty &&
          _cachedResponse != null) {
        emit(
          PackagesSuccess(_cachedResponse!),
        );
      }
    }
  }

  // =========================
  // ✅ INCREASE PROGRESS
  // إكمال الزيارة
  // =========================

  Future<void> increaseProgress({
    required int packageId,
    required int bookingId,
  }) async {
    emit(PackagesActionLoading());

    try {
      print("=================================");
      print("🚀 INCREASE PACKAGE PROGRESS");
      print("packageId = $packageId");
      print("bookingId = $bookingId");
      print("=================================");

      // =========================
      // 1️⃣ PATCH
      // =========================

      await increasePackageProgressUseCase(
        packageId: packageId,
        bookingId: bookingId,
      );

      print("✅ INCREASE PATCH SUCCESS");

      // =========================
      // 2️⃣ ACTION SUCCESS
      // =========================

      emit(
        PackagesActionSuccess(),
      );

      // =========================
      // 3️⃣ GET UPDATED PACKAGES
      // =========================

      try {
        final response = await getPackagesUseCase(
          status: _status,
          duration: _duration,
          search: _search,
        );

        // تحديث الـ cache
        _cachedResponse = response;
        _cachedPackages = response.packages;

        print("✅ PACKAGES REFRESHED AFTER INCREASE");

        // إرسال البيانات الجديدة
        emit(
          PackagesSuccess(response),
        );
      } catch (e) {
        print(
          "❌ ERROR WHILE REFRESHING AFTER INCREASE: $e",
        );

        // الـ PATCH نجح
        // لكن الـ GET فشل
        // نرجع آخر بيانات موجودة

        if (_cachedResponse != null) {
          emit(
            PackagesSuccess(_cachedResponse!),
          );
        }
      }
    } catch (e) {
      print(
        "❌ INCREASE PROGRESS ERROR: $e",
      );

      // =========================
      // 4️⃣ ACTION ERROR
      // =========================

      emit(
        PackagesActionError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء إكمال الزيارة",
        ),
      );

      // =========================
      // 5️⃣ RESTORE OLD DATA
      // =========================

      if (_cachedResponse != null) {
        emit(
          PackagesSuccess(_cachedResponse!),
        );
      }
    }
  }

  // =========================
  // ↩️ DECREASE PROGRESS
  // التراجع عن إكمال الزيارة
  // =========================

  Future<void> decreaseProgress({
    required int packageId,
    required int bookingId,
  }) async {
    emit(PackagesActionLoading());

    try {
      print("=================================");
      print("↩️ DECREASE PACKAGE PROGRESS");
      print("packageId = $packageId");
      print("bookingId = $bookingId");
      print("=================================");

      // =========================
      // 1️⃣ PATCH
      // =========================

      await decreasePackageProgressUseCase(
        packageId: packageId,
        bookingId: bookingId,
      );

      print("✅ DECREASE PATCH SUCCESS");

      // =========================
      // 2️⃣ ACTION SUCCESS
      // =========================

      emit(
        PackagesActionSuccess(),
      );

      // =========================
      // 3️⃣ GET UPDATED PACKAGES
      // =========================

      try {
        final response = await getPackagesUseCase(
          status: _status,
          duration: _duration,
          search: _search,
        );

        // تحديث الـ cache
        _cachedResponse = response;
        _cachedPackages = response.packages;

        print(
          "✅ PACKAGES REFRESHED AFTER DECREASE",
        );

        // إرسال البيانات الجديدة
        emit(
          PackagesSuccess(response),
        );
      } catch (e) {
        print(
          "❌ ERROR WHILE REFRESHING AFTER DECREASE: $e",
        );

        // الـ PATCH نجح
        // لكن الـ GET فشل
        // نرجع آخر بيانات موجودة

        if (_cachedResponse != null) {
          emit(
            PackagesSuccess(_cachedResponse!),
          );
        }
      }
    } catch (e) {
      print(
        "❌ DECREASE PROGRESS ERROR: $e",
      );

      // =========================
      // 4️⃣ ACTION ERROR
      // =========================

      emit(
        PackagesActionError(
          e is Failure
              ? e.message
              : "حدث خطأ أثناء التراجع عن إكمال الزيارة",
        ),
      );

      // =========================
      // 5️⃣ RESTORE OLD DATA
      // =========================

      if (_cachedResponse != null) {
        emit(
          PackagesSuccess(_cachedResponse!),
        );
      }
    }
  }

  // =========================
  // ➕ ADD PACKAGE
  // =========================

  Future<void> addPackage(
    CreatePackageRequest request,
  ) async {
    emit(PackageAddLoading());

    final result = await createPackageUseCase(
      request,
    );

    result.fold(
      (failure) {
        print("❌❌ ADD PACKAGE ERROR");
        print(
          "ERROR TYPE: ${failure.runtimeType}",
        );
        print(
          "ERROR: ${failure.message}",
        );

        emit(
          PackageAddError(
            failure.message,
          ),
        );

        // رجوع للداتا القديمة
        if (_cachedResponse != null) {
          emit(
            PackagesSuccess(
              _cachedResponse!,
            ),
          );
        }
      },
      (_) async {
        print("🔥🔥 ADD PACKAGE SUCCESS");

        try {
          final response = await getPackagesUseCase(
            status: _status,
            duration: _duration,
            search: _search,
          );

          _cachedResponse = response;
          _cachedPackages = response.packages;

          emit(
            PackageAddSuccess(),
          );

          emit(
            PackagesSuccess(response),
          );
        } catch (e) {
          print(
            "❌ ERROR WHILE REFRESHING PACKAGES: $e",
          );

          // الإضافة نفسها نجحت
          // لكن الـ GET فشل

          emit(
            PackageAddSuccess(),
          );

          if (_cachedResponse != null) {
            emit(
              PackagesSuccess(
                _cachedResponse!,
              ),
            );
          }
        }
      },
    );
  }


  Future<void> updatePackage({
  required int packageId,
  required UpdatePackageRequest request,
}) async {
  emit(UpdatePackageLoading());

  final result = await updatePackageUseCase(
    packageId: packageId,
    request: request,
  );

  result.fold(
    (failure) {
      emit(
        UpdatePackageError(
          failure.message,
        ),
      );
    },
    (_) {
      emit(UpdatePackageSuccess());
    },
  );
}

  // =========================
  // 🔄 REFRESH
  // =========================

  Future<void> refresh() async {
    await getPackages(
      status: _status,
      duration: _duration,
      search: _search,
    );
  }

  // =========================
  // 🧠 GETTERS
  // =========================

  List<PackageEntity> get cachedPackages {
    return _cachedPackages;
  }

  PackagesResponseEntity? get cachedResponse {
    return _cachedResponse;
  }

  int get inProgressCount {
    return _cachedResponse?.stats.inProgress ?? 0;
  }

  int get completedCount {
    return _cachedResponse?.stats.completed ?? 0;
  }

  int get scheduledCount {
    return _cachedResponse?.stats.scheduled ?? 0;
  }

  int get pendingCount {
    return _cachedResponse?.stats.pending ?? 0;
  }
}