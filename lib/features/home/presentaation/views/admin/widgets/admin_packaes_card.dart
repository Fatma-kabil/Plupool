import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/progress_btn.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/build_data_time_row.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';

class AdminPackaesCard extends StatelessWidget {
  const AdminPackaesCard({super.key, required this.request});
  final ServiceRequest request;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(request.status);

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
                        " ${request.title} - ${request.userName}",
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      const SizedBox(height: 4),
                      BuildDataTimeRow(request: request),
                    ],
                  ),
                ),
                buildStatusLabel(colors, context, request.status),
              ],
            ),

            const SizedBox(height: 15),
            ProgressSection(
              progress: request.progress!,
              status: request.status,
              visits: request.visits!,
            ),
             const SizedBox(height: 12),
            ProgressBtn(status: request.status,),
            // ---- بيانات المستخدم + زرار الموقع ----
          ],
        ),
      ),
    );
  }
}
