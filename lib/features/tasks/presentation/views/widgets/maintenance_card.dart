import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_history_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/custom_divider.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_item.dart';

class MaintenanceCard extends StatelessWidget {
  final WaterQualityHistoryEntity model;

  const MaintenanceCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // التاريخ والوقت
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                formatArabicDateOnly(model.recordedAt),

                style: AppTextStyles.styleMedium16(
                  context,
                ).copyWith(color: const Color(0xff777777)),
              ),
              Text(
                textDirection: TextDirection.rtl,
                formatTimeArabic3(model.recordedAt),
                
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: const Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(10)),

          // القيم
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaintenanceItem(
                  label: "مستوى الكلور",
                  value: toArabicNumbers("${model.chlorine} "),
                  icon: Icons.science,
                  iconcolor: const Color(0xff00B4D8),
                ),
                CustomDivider(),
                MaintenanceItem(
                  label: "مستوى الحموضة",
                  value: toArabicNumbers(model.ph.toString()),
                  icon: Icons.water_drop,
                  iconcolor: const Color(0xff0077B6),
                ),
                CustomDivider(),
                MaintenanceItem(
                  label: "درجة الحرارة",
                  value: toArabicNumbers("${model.temperature}°"),
                  icon: Icons.thermostat,
                  iconcolor: const Color(0xffFF9F1C),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.h(20)),

          // الملاحظات
          if (model.notes != null && model.notes!.isNotEmpty)
            Text(
              model.notes!,
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
