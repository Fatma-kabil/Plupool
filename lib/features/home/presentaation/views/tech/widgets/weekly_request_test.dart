import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/service_request_card.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/task_card_shimmer.dart';

class WeeklyRequestsList extends StatelessWidget {
  const WeeklyRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicianTasksCubit, TechnicianTasksState>(
      builder: (context, state) {
        if (state is GetWeekTasksLoading) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, __) => const TaskCardShimmer(),
          );
        }

        if (state is GetWeekTasksFailure) {
          return Center(child: Text(state.message));
        }

        if (state is GetWeekTasksSuccess) {
          final tasks = state.tasks;

          if (tasks.isEmpty) {
            return const Center(child: Text('لا توجد مهام'));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length > 3 ? 3 : tasks.length,
            itemBuilder: (context, index) {
              return ServiceRequestCard(task: tasks[index]);
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
