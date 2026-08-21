import 'package:flutter/material.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';
import 'package:plupool/features/visits/presentation/views/widgets/admin_maintenance_card.dart';

class MaintenanceSection extends StatefulWidget {
  const MaintenanceSection({
    super.key,
    required this.visits,required this.sourceBookingId
  });
final int sourceBookingId;
  final List<PackageVisitEntity> visits;

  @override
  State<MaintenanceSection> createState() =>
      _MaintenanceSectionState();
}

class _MaintenanceSectionState extends State<MaintenanceSection> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    // ================= الزيارات المكتملة فقط =================

    final completedVisits = widget.visits
        .where(
          (visit) => visit.status == 'completed',
        )
        .toList();

    // ================= آخر زيارة فوق =================
    // رقم الزيارة الأكبر فوق

    completedVisits.sort(
      (a, b) => b.visitNumber.compareTo(
        a.visitNumber,
      ),
    );

    return Column(
      children: [
        // ================= Header =================

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
                    ).copyWith(
                      color: AppColors.ktextcolor,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.w(5),
                  ),
                  Icon(
                    Icons.access_time,
                    color: AppColors.kprimarycolor,
                    size: SizeConfig.w(17),
                  ),
                ],
              ),

              AnimatedRotation(
                turns: isExpanded ? 0 : 0.5,
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: const Icon(
                  Icons.keyboard_arrow_up,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: SizeConfig.h(8),
        ),

        // ================= Content =================

        if (isExpanded)
          completedVisits.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.h(20),
                  ),
                  child: Center(
                    child: Text(
                      "لا توجد قراءات بعد",
                      style: AppTextStyles.styleMedium16(
                        context,
                      ).copyWith(
                        color: AppColors.ktextcolor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Column(
                  children: completedVisits.map(
                    (visit) {
                      return AdminMaintenanceCard(
                        visit: visit,
sourceBookingId: widget.sourceBookingId,
                        // لو فيه Reading استخدمه
                        // لو مفيش ابعت null
                        reading: visit.readings.isNotEmpty
                            ? visit.readings.first
                            : null,
                      );
                    },
                  ).toList(),
                ),
      ],
    );
  }
}