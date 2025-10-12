import 'package:flutter/material.dart' as flutter;
import 'package:intl/intl.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class WeekDaysBar extends flutter.StatelessWidget {
  final DateTime startDate;
  final int selectedDayIndex;
  final Function(int) onDaySelected;

  const WeekDaysBar({
    super.key,
    required this.startDate,
    required this.selectedDayIndex,
    required this.onDaySelected,
  });

  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.SizedBox(
      height: SizeConfig.h(100),
      child: flutter.Directionality(
        textDirection: flutter.TextDirection.rtl,
        child: flutter.ListView.builder(
          scrollDirection: flutter.Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            final date = startDate.add(Duration(days: index));
            final dayName = DateFormat('EEE', 'ar').format(date);
            final dayNum = DateFormat('d').format(date);
            final isSelected = selectedDayIndex == index;

            return flutter.GestureDetector(
              onTap: () => onDaySelected(index),
              child: flutter.Container(
                margin: flutter.EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(6),
                  vertical: SizeConfig.h(10),
                ),
                padding: flutter.EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(18),
                  vertical: SizeConfig.h(8),
                ),
                decoration: flutter.BoxDecoration(
                  color: isSelected
                      ? AppColors.kprimarycolor.withOpacity(0.1)
                      : flutter.Colors.grey.shade100,
                  borderRadius: flutter.BorderRadius.circular(12),
                  border: flutter.Border.all(
                    color: isSelected
                        ? AppColors.kprimarycolor
                        : flutter.Colors.transparent,
                    width: 2,
                  ),
                ),
                child: flutter.Column(
                  mainAxisAlignment: flutter.MainAxisAlignment.center,
                  children: [
                    flutter.Text(
                      dayName,
                      style: AppTextStyles.styleBold16(context).copyWith(
                      
                        color: isSelected
                            ? AppColors.kprimarycolor
                            : flutter.Colors.black87,
                      ),
                    ),
                     flutter.SizedBox(height:SizeConfig.h(4) ),
                    flutter.Text(
                      dayNum,
                      style: AppTextStyles.styleBold16(context).copyWith(
                      
                        color: isSelected
                            ? AppColors.kprimarycolor
                            : flutter.Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
