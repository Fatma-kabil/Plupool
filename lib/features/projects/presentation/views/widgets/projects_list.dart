import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_card.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key, required this.selected});
  final String selected;
  @override
  Widget build(BuildContext context) {
    final filteredServices = adminProjects.where((adminProjects) {
      switch (selected) {
        case "مكتمله":
          return adminProjects.status == RequestStatus.completed;
        case "مجدوله":
          return adminProjects.status == RequestStatus.scheduled;
        case 'قيد التنفيذ':
          return adminProjects.status == RequestStatus.inProgress;
        case 'عاجله':
          return adminProjects.status == RequestStatus.urgent;
        default:
          return true;
      }
    }).toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProjectCard(model: filteredServices[index]);
      }, childCount: filteredServices.length),
    );
  }
}
