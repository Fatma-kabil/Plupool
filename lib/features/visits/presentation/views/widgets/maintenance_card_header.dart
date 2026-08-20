import 'package:flutter/material.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_date_row.dart';

class MaintenanceCardHeader extends StatelessWidget {
  const MaintenanceCardHeader({
    super.key,
    required this.visit,
    required this.time,
    required this.date,
  });

  final PackageVisitEntity visit;

  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    final status = mapApiStatus(visit.status);

    final colors = RequestStatusColors.getColors(status);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ================= رقم الزيارة + التاريخ =================

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             toArabicNumbers( 'الزيارة #${visit.visitNumber}'),
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(
                color: AppColors.ktextcolor,
              ),
            ),

            SizedBox(
              height: SizeConfig.h(4),
            ),

            MaintenanceDateRow(
              date: date,
            ),
          ],
        ),

        // ================= الحالة =================

        buildStatusLabel(
          colors,
          context,
          status,
        ),
      ],
    );
  }
}