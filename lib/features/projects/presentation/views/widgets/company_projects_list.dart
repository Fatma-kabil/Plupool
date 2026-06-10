import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/projects/presentation/views/widgets/w_company_project_card.dart';

class CompanyProjectsList extends StatelessWidget {
  const CompanyProjectsList({super.key, required this.projects});
   final List <ProjectCardModel> projects;

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
          child: WCompanyProjectCard(project: project),
        );
      },
    );
  }
}