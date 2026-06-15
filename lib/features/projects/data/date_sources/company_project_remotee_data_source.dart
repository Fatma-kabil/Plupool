
import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/projects/data/models/projects_statistics_model.dart';
import 'package:plupool/features/projects/domain/params/client_project_params.dart';
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
      '${Endpoints.projects}/company-projects',
      queryParams: {
        'skip': skip,
        'limit': limit,
        if (status != null) 'status': status,
      },
    );

    final List list = response.data['projects'];

    return list.map((e) => CompanyProjectModel.fromJson(e)).toList();
  }

   Future<ProjectStatisticsModel> getProjectStatistics() async {
    final response = await api.get(
      '${Endpoints.projects}/statistics',
    );

    return ProjectStatisticsModel.fromJson(response.data);
  }
    Future<List<CompanyProjectModel>> getClientProjects({
    required ClientProjectsParams params,
  }) async {
    final response = await api.get(
      
          '${Endpoints.projects}/clients/${params.clientId}/projects',
      queryParams: params.toQuery(),
    );

    final List data = response.data;

    return data
        .map((e) => CompanyProjectModel.fromJson(e))
        .toList();
  }

   Future<void> deleteProject(int projectId) async {
    await api.delete(
      '${Endpoints.projects}/$projectId',
    );
  }
}