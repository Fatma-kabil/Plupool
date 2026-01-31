import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_card.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key, required this.selected});
  final String selected;
  @override
  Widget build(BuildContext context) {
    return SliverList(

      delegate: SliverChildBuilderDelegate((context, index) {
        return ProjectCard(model:adminProjects[index] ,);

      },
      childCount: 8
      ),
    );
  }
}
