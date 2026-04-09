import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';
import 'package:plupool/features/statistics/presentation/manaager/cubits/dashboard_cubit.dart';
import 'package:plupool/features/statistics/presentation/manaager/cubits/dashboard_state.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/dashboard_grid.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/statistics_grid_shimmer.dart';
import 'package:plupool/features/statistics/presentation/views/widgets/statistics_grid_view.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 👇 هنا بس الكيوبت
          BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoading) {
              return StatisticsGridShimmer();

              } else if (state is DashboardError) {
                showCustomSnackBar(context: context, message: state.message);
             //   return const SizedBox();
              } else if (state is DashboardSuccess) {
                return StatisticsGridView(data: state.data);
              }

              return const SizedBox();
            },
          ),

          SizedBox(height: SizeConfig.h(40)),

          /// 👇 ده بعيد عن الكيوبت خالص
          DashboardGrid(),
        ],
      ),
    );
  }
}
