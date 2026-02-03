import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/data/models/water_quality_model.dart';

import 'package:intl/intl.dart' as intl;
import 'package:plupool/features/tasks/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_item.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_card_footer.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_card_header.dart';

class AdminMaintenanceCard extends StatelessWidget {
  const AdminMaintenanceCard({super.key, required this.model});
  final WaterQualityModel model;

  @override
  Widget build(BuildContext context) {
    final formattedDate = intl.DateFormat('d MMMM yyyy – hh:mm a', 'ar')
        .format(model.lastUpdated)
        .replaceAll('ص', 'صباحاً')
        .replaceAll('م', 'مساءً');

    final parts = formattedDate.split('–');

    final time = parts.length > 1 ? parts[1].trim() : '';

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
          // التاريخ والوقت
          MaintenanceCardHeader(model: model, time: time),
          SizedBox(height: SizeConfig.h(15)),

          // القيم
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaintenanceItem(
                  label: "مستوى الكلور",
                  value: "${model.chlorineLevel.toString()} ppm",
                  icon: Icons.science,
                  iconcolor: Color(0xff00B4D8),
                ),
                CustomDivider(),
                MaintenanceItem(
                  label: "مستوى الحموضة",
                  value: model.phLevel.toString(),
                  icon: Icons.water_drop,
                  iconcolor: Color(0xff0077B6),
                ),
                CustomDivider(),
                MaintenanceItem(
                  label: "درجة الحرارة",
                  value: "${model.temperature.toString()}°C",
                  icon: Icons.thermostat,
                  iconcolor: Color(0xffFF9F1C),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.h(20)),

          // الملاحظات
          if (model.note != null && model.note!.isNotEmpty)
            Text(
              model.note!,
              style: AppTextStyles.styleRegular14(
                context,
              ).copyWith(color: const Color(0xff777777)),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
                      SizedBox(height: SizeConfig.h(6)),
            MaintenanceCardFooter()
        ],
      ),
    );
  }
}
