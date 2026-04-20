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

  List<FaqEntity> _cachedFaqs = [];

  /// 📋 GET ALL
  Future<void> getFaqs({String? role, String? category, bool? isActive}) async {
    try {
      emit(FaqLoading());

      _role = role;
      _category = category;
      _isActive = isActive;

      final result = await getFaqsUseCase(
        role: role,
        category: category,
        isActive: isActive,
      );

      result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      _cachedFaqs = result;

      emit(FaqSuccess(result));
    } catch (e) {
      emit(FaqError(e is Failure ? e.message : "حدث خطأ غير متوقع"));
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

      final result = await getFaqsUseCase(
        role: _role,
        category: _category,
        isActive: _isActive,
      );

      result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      _cachedFaqs = result;

   
      emit(FaqCreated());
         emit(FaqSuccess(result));

    } catch (e) {
      emit(FaqError(e is Failure ? e.message : "حدث خطأ غير متوقع"));

      emit(FaqSuccess(_cachedFaqs));
    }
  }

  /// ✏️ UPDATE
  Future<void> updateFaq(FaqEntity faq) async {
    try {
      emit(FaqLoading());
      await updateFaqUseCase(faq);

      final result = await getFaqsUseCase(
        role: _role,
        category: _category,
        isActive: _isActive,
      );

      result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      _cachedFaqs = result;
      emit(FaqUpdated()); // 👈 الأول
      emit(FaqSuccess(result)); // 👈 آخر حاجة
    } catch (e) {
      emit(FaqError(e is Failure ? e.message : "حدث خطأ غير متوقع"));

      emit(FaqSuccess(_cachedFaqs));
    }
  }

  /// 🗑 DELETE
  Future<void> deleteFaq(int id) async {
    try {
      emit(FaqLoading());
      await deleteFaqUseCase(id);

      final result = await getFaqsUseCase(
        role: _role,
        category: _category,
        isActive: _isActive,
      );

      result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      _cachedFaqs = result;

     
      emit(FaqDeleted());
       emit(FaqSuccess(result));
    } catch (e) {
      emit(FaqError(e is Failure ? e.message : "حدث خطأ غير متوقع"));

      emit(FaqSuccess(_cachedFaqs));
    }
  }

  /// 👁 TOGGLE
  Future<void> toggleFaq(int id, bool isActive) async {
    try {
      await toggleUseCase(id: id, isActive: isActive);

      final result = await getFaqsUseCase(
        role: _role,
        category: _category,
        isActive: _isActive,
      );

      result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      _cachedFaqs = result;

      emit(FaqSuccess(result));
    } catch (e) {
      emit(FaqError(e is Failure ? e.message : "حدث خطأ غير متوقع"));

      emit(FaqSuccess(_cachedFaqs));
    }
  }
}
