import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/statistics/presentation/manaager/cubits/dashboard_cubit.dart';
import 'package:plupool/features/statistics/presentation/manaager/cubits/dashboard_state.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/dashboard_grid.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/statistics_grid_shimmer.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/statistics_grid_view.dart';
class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        List<Map<String, int>>? statisticsgridviewStats;
         List<Map<String, int>>? dashboardgridStats;

        if (state is DashboardSuccess) {
          final data = state.data;

          statisticsgridviewStats = [
            {'value': data.totalOrders},
            {'value': data.activePackages},
            {'value': data.processBookings},
            {'value': data.totalReports},
            {'value': data.totalClients},
            {'value': data.totalTechnicians},
          ];
          dashboardgridStats = [
            {'value': data.activeClients},
            {'value': data.activePackages},
            {'value': data.inactiveClients},
            {'value': data.inactivePackages},
          ];
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state is DashboardLoading)
                const StatisticsGridShimmer(),

              if (state is DashboardError)
                ErrorText(message: state.message),

              if (state is DashboardSuccess) ...[
                StatisticsGridView(
               
                  stats: statisticsgridviewStats!, // لو محتاجاه
                ),
                SizedBox(height: SizeConfig.h(40)),
               DashboardGrid(stats: dashboardgridStats!),
              ],

              if (state is! DashboardLoading &&
                  state is! DashboardError &&
                  state is! DashboardSuccess)
                const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}