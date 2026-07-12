import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/service_request_card.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';

class WeeklyRequestsList extends StatelessWidget {
  const WeeklyRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechnicianTasksCubit, TechnicianTasksState>(
      builder: (context, state) {
        if (state is GetTasksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetTasksFailure) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is GetTasksSuccess) {
          final tasks = state.tasks;

          if (tasks.isEmpty) {
            return const Center(
              child: Text('لا توجد مهام'),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length > 3 ? 3 : tasks.length,
            itemBuilder: (context, index) {
              return ServiceRequestCard(
                task: tasks[index],
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}