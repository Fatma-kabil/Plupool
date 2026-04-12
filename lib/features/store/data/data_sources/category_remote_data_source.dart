import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl
    implements CategoryRemoteDataSource {
  final ApiService apiService;

  CategoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get(
      Endpoints.categoriesAll, // 👈 هنفترض إنك عاملاه في EndPoints
    );

    final List data = response.data;

    return data
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}