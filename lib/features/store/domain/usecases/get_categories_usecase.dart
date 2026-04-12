import 'package:plupool/features/store/domain/repos/category_repository.dart';

import '../entities/category_entity.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.getCategories();
  }
}