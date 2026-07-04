import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/progress_btn.dart';
import 'package:plupool/features/packages/domain/entities/subscriber_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';

class AdminPackaesCard extends StatelessWidget {
  const AdminPackaesCard({
    super.key,
    required this.request,
    required this.packageName,
    required this.status,
    required this.packageId
  });

  final SubscriberEntity request;
  final String packageName;
  final String status; // default safe
  final int packageId;

  @override
  Widget build(BuildContext context) {
    //  final status = request.status; // default safe
    final colors = RequestStatusColors.getColors(mapApiStatus(status));

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      decoration: BoxDecoration(
        color: colors['bg'],
        border: Border.all(color: colors['border']),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(17),
          vertical: SizeConfig.h(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- العنوان و الحالة ----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$packageName - ${request.name}",
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: SizeConfig.w(12),
                            color: Color(0xff999999),
                          ),
                          SizedBox(width: SizeConfig.w(6)),
                          Text(
                            textDirection: TextDirection.ltr,
                            formatArabicDateOnly(request.startDate),
                            style: AppTextStyles.styleRegular13(
                              context,
                            ).copyWith(color: Color(0xff999999)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                buildStatusLabel(colors, context, mapApiStatus(status)),
              ],
            ),

            const SizedBox(height: 15),
            ProgressSection(
              progress: request.completedVisits,
              status: mapApiStatus(status),
              visits: request.visits.length,
              progressRatio: (request.totalVisits != 0) ? (request.completedVisits * 100) ~/ request.totalVisits : 0,
            ),
            const SizedBox(height: 12),
            ProgressBtn(status: mapApiStatus(status),bookingId: request.nextVisitId??0,packageId: packageId,),
            // ---- بيانات المستخدم + زرار الموقع ----
          ],
        ),
      ),
    );
  }
}
