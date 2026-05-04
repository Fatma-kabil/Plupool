

import 'package:plupool/features/projects/data/date_sources/project_remot_date_source.dart';
import 'package:plupool/features/projects/data/models/our_project_mapper.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/domain/repos/project_repo.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsRemoteDataSource remote;

  ProjectsRepositoryImpl(this.remote);

  @override
  Future<List<OurProjectEntity>> getOurProjects({
    int skip = 0,
    int limit = 50,
    String? status,
  }) async {
    final response = await remote.getOurProjects(
      skip: skip,
      limit: limit,
      status: status,
    );

    return response.projects
        .map((e) => e.toEntity(response.total))
        .toList();
  }
}