import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_view_header_card.dart';

class CompanyResProjectViewHeader extends StatelessWidget {
  const CompanyResProjectViewHeader({super.key, required this.completedProjects, required this.activeProjects});
  final int completedProjects;
  final int activeProjects;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ProjectViewHeaderCard(
            icon: Icons.folder_outlined,
            value:(completedProjects+activeProjects).toString(),
            label: 'إجمالي المشاريع',
            bkColor: const Color(0xffFFECD2),
            iconColor: const Color(0xffFF9F1C),
          ),
        ),

        SizedBox(width: SizeConfig.w(5)),

        Expanded(
          child: ProjectViewHeaderCard(
            icon: Icons.pending_actions_rounded,
            value: activeProjects.toString(),
            label: 'قيد التنفيذ',
            bkColor: const Color(0xffCCF0F7),
            iconColor: const Color(0xff00B4D8),
          ),
        ),

        SizedBox(width: SizeConfig.w(5)),

        Expanded(
          child: ProjectViewHeaderCard(
            icon: Icons.check_circle_outline,
            value: completedProjects.toString(),
            label: 'مكتمل',
            bkColor: const Color(0xffCDF7EC),
            iconColor: const Color(0xff05B285),
          ),
        ),
      ],
    );
  }
}
