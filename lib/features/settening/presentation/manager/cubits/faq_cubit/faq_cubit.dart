import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/settening/domain/entities/faq_entity.dart';
import 'package:plupool/features/settening/domain/usecases/create_faq_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/delete_faq_usecse.dart';
import 'package:plupool/features/settening/domain/usecases/get_all_faqs_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/get_faq_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/toggel_faq_visability_usecase.dart';
import 'package:plupool/features/settening/domain/usecases/update_faq_usecase.dart';
import 'package:plupool/features/settening/presentation/manager/cubits/faq_cubit/faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  final GetAllFaqsUseCase getFaqsUseCase;
  final CreateFaqUseCase createFaqUseCase;
  final GetFaqUseCase getFaqUseCase;
  final DeleteFaqUseCase deleteFaqUseCase;
  final ToggleFaqVisibilityUseCase toggleUseCase;
  final UpdateFaqUseCase updateFaqUseCase;

  FaqCubit({
    required this.getFaqsUseCase,
    required this.createFaqUseCase,
    required this.getFaqUseCase,
    required this.deleteFaqUseCase,
    required this.toggleUseCase,
    required this.updateFaqUseCase,
  }) : super(FaqInitial());
    String? _role;
  String? _category;
  bool? _isActive;


  /// 📋 GET ALL
  Future<void> getFaqs({String? role, String? category, bool? isActive}) async {
    try {
      emit(FaqLoading());

       /// 🔥 نخزن الفلاتر
      _role = role;
      _category = category;
      _isActive = isActive;

      final result = await getFaqsUseCase(
        role: role,
        category: category,
        isActive: isActive,
      );
      result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      emit(FaqSuccess(result));
    } catch (e) {
      if (e is Failure) {
        emit(FaqError(e.message));
      } else {
        emit(FaqError("حدث خطأ غير متوقع"));
      }
    }
  }

  /// 📄 GET SINGLE
  Future<void> getFaq(int id) async {
    try {
      emit(FaqLoading());

      final faq = await getFaqUseCase(id);

      emit(FaqSingleLoaded(faq));
    } catch (e) {
      emit(FaqError(e.toString()));
    }
  }

  /// ➕ CREATE
  Future<void> createFaq(FaqEntity faq) async {
    try {
      emit(FaqLoading());

      await createFaqUseCase(faq);

      emit(FaqCreated());

      /// refresh list بعد الإضافة
     /// 📋 refresh بنفس الفلاتر المحفوظة
    final result = await getFaqsUseCase(
      role: _role,
      category: _category,
      isActive: _isActive,
    );

    result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    emit(FaqSuccess(result));
  } catch (e) {
    if (e is Failure) {
      emit(FaqError(e.message));
    } else {
      emit(FaqError("حدث خطأ غير متوقع"));
    }
  }
}

   Future<void> updateFaq(FaqEntity faq) async {
  try {
    emit(FaqLoading());

    await updateFaqUseCase(faq);

    /// 📋 refresh بنفس الفلاتر المحفوظة
    final result = await getFaqsUseCase(
      role: _role,
      category: _category,
      isActive: _isActive,
    );

    result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    emit(FaqSuccess(result));
  } catch (e) {
    if (e is Failure) {
      emit(FaqError(e.message));
    } else {
      emit(FaqError("حدث خطأ غير متوقع"));
    }
  }
}
  /// 🗑 DELETE
  Future<void> deleteFaq(int id) async {
    try {
      emit(FaqLoading());

      await deleteFaqUseCase(id);

      emit(FaqDeleted());

      getFaqs();
    } catch (e) {
      emit(FaqError(e.toString()));
    }
  }

  /// 👁 TOGGLE
  Future<void> toggleFaq(int id, bool isActive) async {
  try {
    emit(FaqLoading());

    /// 👁 toggle API
    await toggleUseCase(id: id, isActive: isActive);

    /// 📋 refresh بنفس الفلاتر
    final result = await getFaqsUseCase(
      role: _role,
      category: _category,
      isActive: _isActive,
    );

    result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    /// 🔥 أهم سطر
    emit(FaqSuccess(result));

  } catch (e) {
    if (e is Failure) {
      emit(FaqError(e.message));
    } else {
      emit(FaqError("حدث خطأ غير متوقع"));
    }
  }
}
}
