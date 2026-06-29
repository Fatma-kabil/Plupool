import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/w_company_project_card.dart';

class CompanyProjectsList extends StatelessWidget {
  const CompanyProjectsList({
    super.key,
    required this.projects,
  });

  final List<OurProjectEntity> projects;

  @override
@override
Widget build(BuildContext context) {
  if (projects.isEmpty) {
    return const Center(
      child: ErrorText(message: 'لا توجد مشاريع شركات بعد',
        
       ),
    );
  }

  final Map<String, List<OurProjectEntity>> groupedProjects = {};

  for (final project in projects) {
    final company = project.companyPartner ?? "";

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