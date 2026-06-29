import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/widgets/project_card.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';

class UsersProjectsList extends StatelessWidget {
  const UsersProjectsList({super.key, required this.projects});

  final List<OurProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const Center(child: ErrorText(message: '📂 لا توجد مشاريع بعد'));
    }

    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ProjectCard(project: project),
        );
      },
    );
  }
}
