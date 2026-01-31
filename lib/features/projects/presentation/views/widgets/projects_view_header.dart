import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_view_header_card.dart';

class ProjectsViewHeader extends StatelessWidget {
  const ProjectsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: ProjectViewHeaderCard(
            icon: Icons.folder_outlined, // تقييم
            value: "3",
            label: 'إجمالي المشاريع',
            bkColor: Color(0xffFFECD2),
            iconColor: Color(0xffFF9F1C),
          ),
        ),

        SizedBox(width: SizeConfig.w(5)),

        Expanded(
          flex: 1,
          child: ProjectViewHeaderCard(
            icon: Icons.pending_actions_rounded, // تقييم
            value: "5",
            label: 'قيد التنفيذ',
            bkColor: Color(0xffCCF0F7),
            iconColor: Color(0xff00B4D8),
          ),
        ),

        SizedBox(width: SizeConfig.w(5)),
        Expanded(
          flex: 1,
          child: ProjectViewHeaderCard(
            icon: Icons.check_circle_outline, // تقييم
            value: "2",
            label: 'مكتمل',
            bkColor: Color(0xffCDF7EC),
            iconColor: Color(0xff05B285),
          ),
        ),
      ],
    );
  }
}
