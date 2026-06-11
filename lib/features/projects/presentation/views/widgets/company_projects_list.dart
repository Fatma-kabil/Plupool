import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/project_card_model.dart';
import 'package:plupool/features/projects/presentation/views/widgets/w_company_project_card.dart';

class CompanyProjectsList extends StatelessWidget {
  const CompanyProjectsList({
    super.key,
    required this.projects,
  });

  final List<ProjectCardModel> projects;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ProjectCardModel>> groupedProjects = {};

    for (final project in projects) {
      final company = project.companyName ?? "";

      groupedProjects.putIfAbsent(company, () => []);
      groupedProjects[company]!.add(project);
    }

    final companiesProjects = groupedProjects.values.toList();

    return ListView.builder(
      itemCount: companiesProjects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: WCompanyProjectCard(
            projects: companiesProjects[index],
          ),
        );
      },
    );
  }
}