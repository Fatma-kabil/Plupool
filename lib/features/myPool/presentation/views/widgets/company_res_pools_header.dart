import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/domain/entities/clients_stats_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_view_header_card.dart';

class CompanyResPoolsHeader extends StatelessWidget {
  const CompanyResPoolsHeader({
    super.key,
    required this.stats,
  });

  final ClientsStatsEntity stats;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ProjectViewHeaderCard(
            icon: Icons.pool_rounded,
            value: stats.totalPools.toString(),
            label: 'إجمالي المسابح',
            bkColor: const Color(0xffFFECD2),
            iconColor: const Color(0xffFF9F1C),
          ),
        ),
        SizedBox(width: SizeConfig.w(5)),
        Expanded(
          child: ProjectViewHeaderCard(
            icon: Icons.pending_actions_rounded,
            value: stats.activePackages.toString(),
            label: 'باقات نشطة',
            bkColor: const Color(0xffCCF0F7),
            iconColor: const Color(0xff00B4D8),
          ),
        ),
        SizedBox(width: SizeConfig.w(5)),
        Expanded(
          child: ProjectViewHeaderCard(
            icon: Icons.check_circle_outline,
            value: stats.completedTasks.toString(),
            label: 'مهام مكتملة',
            bkColor: const Color(0xffCDF7EC),
            iconColor: const Color(0xff05B285),
          ),
        ),
      ],
    );
  }
}