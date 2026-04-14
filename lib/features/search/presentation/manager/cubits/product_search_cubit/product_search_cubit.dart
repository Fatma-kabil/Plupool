import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/error/failure.dart';
import 'package:plupool/features/search/domain/usecases/search_products_usecase.dart';
import 'package:plupool/features/search/presentation/manager/cubits/product_search_cubit/product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  final SearchProductsUseCase useCase;

  ProductSearchCubit(this.useCase) : super(ProductSearchInitial());

  void search(String query) async {
    if (query.isEmpty) return;
  print("🔥 SEARCH STARTED: $query");
    emit(ProductSearchLoading());

    try {
      final result = await useCase(query);
       print("🔥 RESULT LENGTH: ${result.length}");

      emit(ProductSearchSuccess(result));
       print("🔥 EMITTED SUCCESS");
    } catch (e) {
      if (e is Failure) {
        emit(ProductSearchError(e.message));
      } else {
        emit(ProductSearchError("حدث خطأ أثناء البحث عن المنتجات"));
        print(" Error in ProductSearchCubit: $e");
      }
    }
  }
}
