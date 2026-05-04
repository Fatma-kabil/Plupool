import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

abstract class ProjectsRepository {
  Future<List<OurProjectEntity>> getOurProjects({
    int skip,
    int limit,
    String? status,
  });
}