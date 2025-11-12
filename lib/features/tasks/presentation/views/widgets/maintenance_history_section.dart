import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/data/models/water_quality_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_card.dart';

class MaintenanceHistorySection extends StatefulWidget {
  const MaintenanceHistorySection({super.key});

  @override
  State<MaintenanceHistorySection> createState() =>
      _MaintenanceHistorySectionState();
}

class _MaintenanceHistorySectionState extends State<MaintenanceHistorySection> {
  bool isExpanded = true; // الحالة المفتوحة أو المغلقة

  final List<WaterQualityModel> history = [
    WaterQualityModel(
      temperature: 25,
      phLevel: 7.2,
      chlorineLevel: 2.5 ,
      note: "جميع القراءات طبيعية. تم تنظيف سلال الكاشطة وغسل الفلتر.",
      lastUpdated: DateTime(2025, 10, 8, 18, 26),
    ),
    WaterQualityModel(
      temperature: 26,
      phLevel: 7.9,
      chlorineLevel: 1.8 ,
      note: "تمت إضافة معالجة الكلور. فحص ضغط المضخة - تعمل بشكل طبيعي.",
      lastUpdated: DateTime(2025, 10, 20, 11, 0),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // العنوان والسهم
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "تاريخ الصيانة",
                    style: AppTextStyles.styleBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  SizedBox(width: SizeConfig.w(5)),
                  Icon(
                    Icons.access_time,
                    color: AppColors.kprimarycolor,
                    size: SizeConfig.w(17),
                  ),
                ],
              ),
              AnimatedRotation(
                turns: isExpanded ? 0 : 0.5, // يقلب السهم لأعلى أو لأسفل
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // المحتوى القابل للطي
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          crossFadeState: isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
         firstChild: Column(
            children: history
                .map((model) => MaintenanceCard(model: model))
                .toList(),
          ),
          secondChild: const SizedBox.shrink(),
        ),
      ],
    );
  }
}

