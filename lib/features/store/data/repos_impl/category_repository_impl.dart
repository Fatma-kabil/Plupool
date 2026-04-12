import 'package:plupool/features/store/data/data_sources/category_remote_data_source.dart';
import 'package:plupool/features/store/domain/repos/category_repository.dart';

import '../../domain/entities/category_entity.dart';


class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final models = await remoteDataSource.getCategories();

    return models.map((e) => e.toEntity()).toList();
  }
}