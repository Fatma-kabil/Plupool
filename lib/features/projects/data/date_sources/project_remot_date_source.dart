

import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/projects/data/models/our_projects_response_model.dart';

class ProjectsRemoteDataSource {
  final ApiService api;

  ProjectsRemoteDataSource(this.api);

  Future<OurProjectsResponseModel> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    final response = await api.get(
     " ${Endpoints.projects}/our-projects",
      queryParams: {
        'skip': skip,
        'limit': limit,
        if (status != null) 'status': status,
      },
    );

    return OurProjectsResponseModel.fromJson(response.data);
  }
}