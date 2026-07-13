import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/note_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/water_quality_card.dart';

class WaterQualitySection extends StatelessWidget {
  const WaterQualitySection({super.key, required this.data});

  final WaterQualityEntity data;

  @override
  Widget build(BuildContext context) {
    final latest = data.latest;
    final ideal = data.idealRanges;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.w(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          /// Header
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مقاييس جودة المياه",
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  SizedBox(height: SizeConfig.h(4)),
                  Text(
                    "آخر تحديث : ${formatArabicDate(latest.recordedAt)}",
                    style: AppTextStyles.styleRegular14(
                      context,
                    ).copyWith(color: const Color(0xff999999)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.push('/maintenanceupdateview', extra: data);
                },
                child: Text(
                  "تحديث",
                  style: AppTextStyles.styleBold16(context).copyWith(
                    color: AppColors.kprimarycolor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(16)),

          /// Chlorine
          WaterQualityCard(
            title: "مستوى الكلور",
            value: toArabicNumbers("${latest.chlorine} "),
            idealRange: ideal.chlorine,
            icon: Icons.science_outlined,
            color: const Color(0xFF00B4D8),
            backgroundcolor: const Color(0xffCCF0F7),
          ),

          SizedBox(height: SizeConfig.h(8)),

          /// PH
          WaterQualityCard(
            title: "مستوى الحموضة",
            value: toArabicNumbers(latest.ph.toString()),
            idealRange: ideal.ph,
            icon: Icons.water_drop_outlined,
            color: const Color(0xFF0077B6),
            backgroundcolor: const Color(0xffCCE4F0),
          ),

          SizedBox(height: SizeConfig.h(8)),

          /// Temperature
          WaterQualityCard(
            title: "درجة الحرارة",
            value: toArabicNumbers("${latest.temperature}°"),
            idealRange: ideal.temperature,
            icon: Icons.thermostat,
            color: const Color(0xFFFF9F1C),
            backgroundcolor: const Color(0xffFFECD2),
          ),

          SizedBox(height: SizeConfig.h(16)),

          if (latest.notes!.isNotEmpty) NoteSection(note: latest.notes!),
        ],
      ),
    );
  }
}
