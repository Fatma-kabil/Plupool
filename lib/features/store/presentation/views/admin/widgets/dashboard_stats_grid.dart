import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/stat_card.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dashboardStats.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
           childAspectRatio: SizeConfig.isWideScreen?2.5:2 ,
            
          crossAxisSpacing:SizeConfig.w(12) ,
          mainAxisSpacing:SizeConfig.h(12) ,
        ),
        itemBuilder: (context, index) {
          return StatCard(model: dashboardStats[index]);
        },
      ),
    );
  }
}
