import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/maintenance/domain/entities/maintenance_section_entity.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_pool_card.dart';

class MaintenancePoolsList extends StatelessWidget {
  const MaintenancePoolsList({
    super.key,
    required this.sections,
  });

  final List<MaintenanceSectionEntity> sections;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sections
          .map(
            (section) => Padding(
              padding: EdgeInsets.only(
                bottom: SizeConfig.h(22),
              ),
              child: MaintenancePoolCard(
                section: section,
              ),
            ),
          )
          .toList(),
    );
  }
}