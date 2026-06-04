import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/project_card.dart';

class UsersProjectsList extends StatelessWidget {
  const UsersProjectsList({super.key, required this.projects});
  final List<ProjectCardModel> projects;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     // physics: const NeverScrollableScrollPhysics(),
    //  shrinkWrap: true,
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding:  EdgeInsets.only(bottom: 12.0),
          child: ProjectCard(project: project),
        );
      },
    );
  }
}
