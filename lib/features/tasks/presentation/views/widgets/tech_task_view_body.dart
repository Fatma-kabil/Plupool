import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/functions/show_full_width_bottom_sheet.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/my_task_view_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/task_card_shimmer.dart';

class TechTaskViewBody extends StatefulWidget {
  const TechTaskViewBody({super.key});

  @override
  State<TechTaskViewBody> createState() => _TechTaskViewBodyState();
}

class _TechTaskViewBodyState extends State<TechTaskViewBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TechnicianTasksCubit>().getTasks(
        dateFrom: DateTime.now().toString().split(' ').first,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "مهامي",
                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              const Spacer(),
              FilterButton(
                onTap: () async {
                  final filter = await showFullWidthBottomSheet(context);

                  if (filter == null) return;

                  context.read<TechnicianTasksCubit>().getTasks(
                    status: filter.statuses,
                    serviceTypes: filter.serviceTypes,
                    locations: filter.locations,
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 25),

          BlocBuilder<TechnicianTasksCubit, TechnicianTasksState>(
            builder: (context, state) {
              if (state is GetTasksLoading) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (_, __) => const TaskCardShimmer(),
                );
              }

              if (state is GetTasksFailure) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              }

              if (state is GetTasksSuccess) {
                final tasks = state.tasks.where((task) {
                  return mapApiStatus(task.status) !=
                      RequestStatus.completed;
                }).toList();

                if (tasks.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text("لا توجد مهام"),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return MyTaskViewCard(
                      key: ValueKey(tasks[index].id),
                      task: tasks[index],
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}