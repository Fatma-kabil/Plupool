import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/maintenance_pool_card.dart';

class MaintenancePoolsList extends StatelessWidget {
  const MaintenancePoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: maintenancePools
          .map(
            (pool) => Padding(
              padding:  EdgeInsets.only(bottom:SizeConfig.h(22) ),
              child: MaintenancePoolCard(
                maintenancePool: pool,
               
              ),
            ),
          )
          .toList(),
    );
  }
}
