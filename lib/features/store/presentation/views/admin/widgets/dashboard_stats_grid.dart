import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/store/presentation/cubits/store_statistics_cubit/store_statistics_cubit.dart';
import 'package:plupool/features/store/presentation/cubits/store_statistics_cubit/store_statistics_state.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/dashboard_stats_shimmer.dart';
import 'package:plupool/features/store/presentation/views/admin/widgets/stat_card.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreStatisticsCubit, StoreStatisticsState>(
      listener: (context, state) {
        if (state is StoreStatisticsError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      child: BlocBuilder<StoreStatisticsCubit, StoreStatisticsState>(
        builder: (context, state) {

          /// 🔄 Loading
          if (state is StoreStatisticsLoading) {
            return const DashboardStatsShimmer();
          }

          /// ✅ Success
          if (state is StoreStatisticsSuccess) {
            final stats = [
              {"value": state.data.totalOrders},
              {"value": state.data.totalProducts},
            ];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dashboardStats.length, // ✅ الصح
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      SizeConfig.isWideScreen ? 2.5 : 2,
                  crossAxisSpacing: SizeConfig.w(12),
                  mainAxisSpacing: SizeConfig.h(12),
                ),
                itemBuilder: (context, index) {
                  return StatCard(
                    model: dashboardStats[index],
                    data: stats[index]['value']!,
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}