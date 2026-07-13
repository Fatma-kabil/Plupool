import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/customer_details_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/customer_info_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_history_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/pool_info_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/required_services_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/water_quality_section.dart';

class CustomerDetailsViewBody extends StatefulWidget {
  const CustomerDetailsViewBody({super.key, required this.taskId});

  final int taskId;

  @override
  State<CustomerDetailsViewBody> createState() =>
      _CustomerDetailsViewBodyState();
}

class _CustomerDetailsViewBodyState extends State<CustomerDetailsViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<TechnicianTasksCubit>().getTaskDetails(
      //   taskId: widget.taskId,
      taskId: 58,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocBuilder<TechnicianTasksCubit, TechnicianTasksState>(
      builder: (context, state) {
        if (state is GetTaskDetailsLoading) {
          return CustomerDetailsShimmer();
        }

        if (state is GetTaskDetailsFailure) {
          return Center(child: ErrorText(message: state.message));
        }

        if (state is GetTaskDetailsSuccess) {
          final data = state.taskDetails;

          return ListView(
            children: [
              CustomerInfoCard(client: data.client),

              SizedBox(height: SizeConfig.h(24)),

              PoolInfoSection(pool: data.poolProfile),

              SizedBox(height: SizeConfig.h(24)),

              WaterQualitySection(data: data.waterQuality),

              SizedBox(height: SizeConfig.h(24)),

              // RequiredServicesSection(
              //  task: data.task,
              // ),

              //SizedBox(height: SizeConfig.h(24)),
              MaintenanceHistorySection(history: data.waterQuality.history),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
