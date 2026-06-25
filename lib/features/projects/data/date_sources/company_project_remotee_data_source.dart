import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/features/projects/data/models/projects_statistics_model.dart';
import 'package:plupool/features/projects/domain/params/client_project_params.dart';
import 'package:plupool/features/projects/domain/params/update_project_progress_params.dart';
import '../../../../core/network/end_points.dart';
import '../models/company_project_model.dart';

class CompanyProjectsRemoteDataSourceImpl {
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
    final response = await api.get('${Endpoints.projects}/statistics');

    return ProjectStatisticsModel.fromJson(response.data);
  }

  Future<List<CompanyProjectModel>> getClientProjects({
    required ClientProjectsParams params,
  }) async {
    final response = await api.get(
      '${Endpoints.projects}/clients/${params.clientId}/projects',
      queryParams: params.toQuery(),
    );

    final raw = response.data['projects'];

    if (raw is! List) return [];

    return raw.map((e) => CompanyProjectModel.fromJson(e)).toList();
  }

  Future<void> deleteProject(int projectId) async {
    await api.delete('${Endpoints.projects}/$projectId');
  }

  Future<void> updateProjectProgress(UpdateProjectProgressParams params) async {
    await api.patch(
      '${Endpoints.projects}/${params.projectId}/progress',
      queryParams: {
        'progress_percentage': params.progressPercentage,
        if (params.newStatus != null) 'new_status': params.newStatus,
        if (params.adminNotes != null) 'admin_notes': params.adminNotes,
      },
    );
  }
}
