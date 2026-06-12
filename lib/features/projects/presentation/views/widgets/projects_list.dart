import 'package:flutter/material.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_card.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    super.key,
    required this.projects,
  });

  final List<CompanyProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProjectCard(
            project: projects[index],
          );
        },
        childCount: projects.length,
      ),
    );
  }
}