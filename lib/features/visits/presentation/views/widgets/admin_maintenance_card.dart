import 'package:flutter/material.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';

import 'package:plupool/features/tasks/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_item.dart';

import 'package:plupool/features/visits/presentation/views/widgets/maintenance_card_footer.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_card_header.dart';

class AdminMaintenanceCard extends StatelessWidget {
  const AdminMaintenanceCard({
    super.key,
    required this.visit,
    required this.reading,
  });

  final PackageVisitEntity visit;
  final ReadingEntity? reading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.h(6),
        horizontal: SizeConfig.w(6),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        children: [
          // ================= التاريخ والوقت =================
          MaintenanceCardHeader(
            visit: visit,
            date: visit.bookingDate ?? '',
            time: visit.bookingTime ?? '',
          ),

          SizedBox(height: SizeConfig.h(15)),

          // ================= القيم =================
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Chlorine
                MaintenanceItem(
                  label: "مستوى الكلور",
                  value: reading?.chlorinePpm != null
                      ? "${reading!.chlorinePpm} ppm"
                      : "-",
                  icon: Icons.science,
                  iconcolor: const Color(0xff00B4D8),
                ),

                CustomDivider(),

                // PH
                MaintenanceItem(
                  label: "مستوى الحموضة",
                  value: reading?.phLevel != null
                      ? reading!.phLevel.toString()
                      : "-",
                  icon: Icons.water_drop,
                  iconcolor: const Color(0xff0077B6),
                ),

                CustomDivider(),

                // Temperature
                MaintenanceItem(
                  label: "درجة الحرارة",
                  value: reading?.temperatureC != null
                      ? "${reading!.temperatureC}°C"
                      : "-",
                  icon: Icons.thermostat,
                  iconcolor: const Color(0xffFF9F1C),
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          // ================= الملاحظات =================
          if (reading?.notes != null && reading!.notes!.isNotEmpty)
            Text(
              reading!.notes!,
              style: AppTextStyles.styleRegular14(
                context,
              ).copyWith(color: const Color(0xff777777)),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),

          SizedBox(height: SizeConfig.h(6)),

          MaintenanceCardFooter(),
        ],
      ),
    );
  }
}
