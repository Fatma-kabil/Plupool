import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/store/domain/usecases/get_categories_usecase.dart';
import 'package:plupool/features/store/presentation/cubits/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      final result = await getCategoriesUseCase();
      emit(CategorySuccess(result));
    } catch (e) {
      if (e is Failure) {
        emit(CategoryError(e.message));
      } else {
        emit(CategoryError("حدث خطأ اثناء تحميل التصنيفات"));
        print(e.toString());
      }
    }
  }
}
