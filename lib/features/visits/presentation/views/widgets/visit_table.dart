import 'package:flutter/material.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/visits/domain/entities/booking_visits_entity.dart';

class VisitsTable extends StatelessWidget {
  const VisitsTable({
    super.key,
    required this.visits,
  });

  final List<PackageVisitEntity> visits;

  @override
  Widget build(BuildContext context) {
    // ================= ترتيب الزيارات =================
    // آخر زيارة فوق، وأول زيارة تحت
    final sortedVisits = [...visits]
      ..sort(
        (a, b) => b.visitNumber.compareTo(a.visitNumber),
      );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(4),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // ================= Header =================

          Row(
            children: [
              Expanded(
                child: Text(
                  'رقم الزيارة',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(
                    color: AppColors.ktextcolor,
                  ),
                ),
              ),

              Container(
                width: SizeConfig.w(1),
                height: SizeConfig.h(25),
                color: AppColors.textFieldBorderColor,
              ),

              Expanded(
                child: Text(
                  'الحالة',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(
                    color: AppColors.ktextcolor,
                  ),
                ),
              ),
            ],
          ),

          const Divider(
            color: AppColors.textFieldBorderColor,
          ),

          // ================= Rows =================

          SizedBox(
            height: SizeConfig.h(200),
            child: ListView.separated(
              itemCount: sortedVisits.length,

              separatorBuilder: (_, __) {
                return const Divider(
                  color: AppColors.textFieldBorderColor,
                );
              },

              itemBuilder: (context, index) {
                final visit = sortedVisits[index];

                final status = mapApiStatus(
                  visit.status,
                );

                final colors =
                    RequestStatusColors.getColors(
                  status,
                );

                return Row(
                  children: [
                    // ================= Visit Number =================

                    Expanded(
                      child: Text(
                     toArabicNumbers('الزيارة #${visit.visitNumber}'),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(
                          color: AppColors.ktextcolor,
                        ),
                      ),
                    ),

                    // ================= Divider =================

                    Container(
                      width: SizeConfig.w(1),
                      height: SizeConfig.h(35),
                      color: AppColors.textFieldBorderColor,
                    ),

                    // ================= Status =================

                    Expanded(
                      child: Center(
                        child: buildStatusLabel(
                          colors,
                          context,
                          status,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}