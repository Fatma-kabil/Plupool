import 'package:plupool/core/network/api_service.dart';
import 'package:plupool/core/network/end_points.dart';
import 'package:plupool/features/projects/data/models/our_project_moddel.dart';

class OurProjectsRemoteDataSource {
  final ApiService apiService;

  OurProjectsRemoteDataSource(this.apiService);

  Future<List<OurProjectModel>> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
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
}
