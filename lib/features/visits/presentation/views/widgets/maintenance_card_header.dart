import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/data/models/water_quality_model.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_date_row.dart';

class MaintenanceCardHeader extends StatelessWidget {
  const MaintenanceCardHeader({
    super.key,
    required this.model,
    required this.time, required this.date,
  });

  final WaterQualityModel model;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الزيارة #1',

              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(height: SizeConfig.h(4)),
            MaintenanceDateRow(date: date, time: time),
          ],
        ),
        buildStatusLabel(
          RequestStatusColors.getColors(RequestStatus.completed),
          context,
          RequestStatus.completed,
        ),
      ],
    );
  }
}
