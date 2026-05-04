
import 'package:plupool/core/network/api_service.dart';
import '../../../../core/network/end_points.dart';
import '../models/company_project_model.dart';



class CompanyProjectsRemoteDataSourceImpl   {
  final ApiService api;

  CompanyProjectsRemoteDataSourceImpl(this.api);


  Future<List<CompanyProjectModel>> getCompanyProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    final response = await api.get(
      '${Endpoints.projects}company-projects',
      queryParams: {
        'skip': skip,
        'limit': limit,
        if (status != null) 'status': status,
      },
    );

    final List list = response.data['projects'];

    return list.map((e) => CompanyProjectModel.fromJson(e)).toList();
  }
}