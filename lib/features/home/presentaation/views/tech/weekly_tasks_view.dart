import 'package:flutter/material.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tasks_list.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/week_day_bar.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/tasks_stae.dart';
import 'package:plupool/features/tasks/presentation/views/manager/tasks_cubit/week_tasks_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/task_card_shimmer.dart';

class WeeklyTasksView extends flutter.StatefulWidget {
  const WeeklyTasksView({super.key});

  @override
  flutter.State<WeeklyTasksView> createState() => _WeeklyTasksViewState();
}

class _WeeklyTasksViewState extends flutter.State<WeeklyTasksView> {
  int selectedDayIndex = 0;
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ar');
  }

  @override
  flutter.Widget build(flutter.BuildContext context) {
    final startDate = now;
    final endDate = now.add(const Duration(days: 6));

    final formattedRange =
        "${DateFormat('d MMMM', 'ar').format(startDate)} - ${DateFormat('d MMMM yyyy', 'ar').format(endDate)}";

    return flutter.Scaffold(
      body: flutter.SafeArea(
        child: flutter.Padding(
          padding: flutter.EdgeInsets.symmetric(
            horizontal: SizeConfig.w(17),
            vertical: SizeConfig.h(15),
          ),
          child: flutter.Column(
            crossAxisAlignment: flutter.CrossAxisAlignment.start,
            children: [
              flutter.SizedBox(height: SizeConfig.h(10)),

              flutter.Text(
                'مهام الأسبوع',
                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),

              flutter.Padding(
                padding: flutter.EdgeInsets.only(top: SizeConfig.h(6)),
                child: flutter.Text(
                  formattedRange,
                  textDirection: flutter.TextDirection.rtl,
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: const flutter.Color(0xff777777)),
                ),
              ),

              flutter.SizedBox(height: SizeConfig.h(8)),

              WeekDaysBar(
                startDate: startDate,
                selectedDayIndex: selectedDayIndex,
                onDaySelected: (index) {
                  setState(() {
                    selectedDayIndex = index;
                  });
                },
              ),

              const flutter.Divider(),

              flutter.Expanded(
                child: BlocBuilder<WeekTasksCubit, TechnicianTasksState>(
                  builder: (context, state) {
                    if (state is GetWeekTasksLoading) {
                      return flutter.ListView.builder(
                        shrinkWrap: true,
                        physics: const flutter.NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (_, __) => const TaskCardShimmer(),
                      );
                    }

                    if (state is GetWeekTasksFailure) {
                      return flutter.Center(child: flutter.Text(state.message));
                    }

                    if (state is GetWeekTasksSuccess) {
                      if (state.tasks.isEmpty) {
                        return const flutter.Center(
                          child: flutter.Text('لا توجد مهام هذا الأسبوع'),
                        );
                      }

                      return flutter.AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: flutter.Padding(
                          key: flutter.ValueKey(selectedDayIndex),
                          padding: flutter.EdgeInsets.symmetric(
                            vertical: SizeConfig.h(8),
                          ),
                          child: TasksList(
                            startDate: startDate,
                            dayIndex: selectedDayIndex,
                            tasks: state.tasks,
                          ),
                        ),
                      );
                    }

                    return const flutter.SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
