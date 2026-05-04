import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/domain/repos/project_repo.dart';

class GetOurProjectsUseCase {
  final ProjectsRepository repository;

  GetOurProjectsUseCase(this.repository);

  Future<List<OurProjectEntity>> call({
    int skip = 0,
    int limit = 50,
    String? status,
  }) {
    return repository.getOurProjects(
      skip: skip,
      limit: limit,
      status: status,
    );
  }
}