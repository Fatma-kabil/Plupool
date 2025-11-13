import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/data/models/water_quality_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_item.dart';

class MaintenanceCard extends StatelessWidget {
  final WaterQualityModel model;

  const MaintenanceCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final formattedDate = intl.DateFormat('d MMMM yyyy – hh:mm a', 'ar')
        .format(model.lastUpdated)
        .replaceAll('ص', 'صباحاً')
        .replaceAll('م', 'مساءً');

    final parts = formattedDate.split('–');
    final date = parts[0].trim();
    final time = parts.length > 1 ? parts[1].trim() : '';

    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
      padding: EdgeInsets.symmetric(horizontal:  SizeConfig.w(15),vertical: SizeConfig.h(10) ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // التاريخ والوقت
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                date,
                style: AppTextStyles.styleMedium16(
                  context,
                ).copyWith(color: const Color(0xff777777)),
              ),
              Text(
                textDirection: TextDirection.rtl,
                time,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: const Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(10)),
      
          // القيم
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
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
           SizedBox(height:SizeConfig.h(20) ),
      
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
        ],
      ),
    );
  }
}
