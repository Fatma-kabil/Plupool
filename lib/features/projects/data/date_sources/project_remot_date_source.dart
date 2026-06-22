import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/projects/data/models/our_project_moddel.dart';
import 'package:plupool/features/projects/data/models/update_project_model.dart';

class OurProjectsRemoteDataSource {
  final ApiService apiService;

  OurProjectsRemoteDataSource(this.apiService);

  Future<List<OurProjectModel>> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
    bool? hasPartener,
  }) async {
    final queryParameters = {'skip': skip, 'limit': limit};

    final response = await apiService.get(
      '${Endpoints.projects}/our-projects',
      queryParams: queryParameters,
    );

    return (response.data['projects'] as List)
        .map((e) => OurProjectModel.fromJson(e))
        .toList();
  }

   Future<void> updateProject(
    UpdateProjectRequest request,
  ) async {

    final formData = await request.toFormData();

    await apiService.patch(
      "${Endpoints.projects}/${request.projectId}/update-with-image",
      data: formData,
    );
  }
}
