import 'package:flutter/material.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/statistics_grid_view.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //  SizedBox(height: SizeConfig.h(10)),
        StatisticsGridView()
      
        ],
      ),
    );
  }
}