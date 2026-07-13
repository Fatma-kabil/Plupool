import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/domain/entities/water_quality_history_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_card.dart';

class MaintenanceHistorySection extends StatefulWidget {
  const MaintenanceHistorySection({super.key, required this.history});
  final List<WaterQualityHistoryEntity> history;
  @override
  State<MaintenanceHistorySection> createState() =>
      _MaintenanceHistorySectionState();
}

class _MaintenanceHistorySectionState extends State<MaintenanceHistorySection> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final sortedHistory = [...widget.history]
      ..sort(
        (a, b) => DateTime.parse(
          b.recordedAt,
        ).compareTo(DateTime.parse(a.recordedAt)),
      );

    return Column(
      children: [
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
                turns: isExpanded ? 0 : 0.5,
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ],
          ),
        ),

        SizedBox(height: SizeConfig.h(8)),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          crossFadeState: isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Column(
            children: sortedHistory
                .map((item) => MaintenanceCard(model: item))
                .toList(),
          ),
          secondChild: const SizedBox.shrink(),
        ),
      ],
    );
  }
}
