import 'package:flutter/material.dart' as flutter;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/week_day_bar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tasks_list.dart';

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
    initializeDateFormatting('ar'); // ✅ إعداد دعم اللغة العربية
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
            crossAxisAlignment: flutter.CrossAxisAlignment.end,
            children: [
            flutter. SizedBox(height: SizeConfig.h(10),),
              flutter.Text(
                'مهام الأسبوع',
                style: AppTextStyles.styleBold20(context)
                    .copyWith(color: AppColors.ktextcolor),
              ),
              flutter.Padding(
                padding: flutter.EdgeInsets.only(top: SizeConfig.h(6)),
                child: flutter.Text(
                  textDirection:flutter.TextDirection.rtl,
                  formattedRange,
                  style: AppTextStyles.styleMedium16(context)
                      .copyWith(color: flutter.Color(0xff777777)),
                ),
              ),
              flutter.SizedBox(height: SizeConfig.h(8)),

              WeekDaysBar(
                startDate: startDate,
                selectedDayIndex: selectedDayIndex,
                onDaySelected: (index) {
                  setState(() => selectedDayIndex = index);
                },
              ),

              const flutter.Divider(),

              flutter.Expanded(
                child: flutter.AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: flutter.Padding(
                    padding:
                        flutter.EdgeInsets.symmetric(vertical: SizeConfig.h(8)),
                    child: TasksList(
                      key: flutter.ValueKey(selectedDayIndex),
                      startDate: startDate,
                      dayIndex: selectedDayIndex,
                      requests: requests,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
