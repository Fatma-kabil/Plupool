import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/data/models/admin_project_model.dart';
import 'package:plupool/features/projects/presentation/views/widgets/admin_project_card_footer.dart';
import 'package:plupool/features/projects/presentation/views/widgets/next_visit_and_pools.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_location_row.dart';
import 'package:plupool/features/projects/presentation/views/widgets/start_end_project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.model});

  final AdminProjectModel model;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(model.status);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: colors['bg'],
        border: Border.all(color: colors['border']),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- العنوان و الحالة ----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  model.projectTitle,
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Color(0xff333333)),
                ),

                buildStatusLabel(colors, context, model.status),
              ],
            ),
            //   SizedBox(height: 8),
            ProjectLocationRow(location: "القاهرة الجديدة",),

            const SizedBox(height: 12),
            StartEndProject(
              startDate: model.startDate,
              endDate: model.finishedDate,
            ),

           
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(10),
                vertical: SizeConfig.h(12),
              ),
              child: Divider(),
            ),
            NextVisitAndPools(model: model),
            SizedBox(height: SizeConfig.h(12)),
            AdminProjectCardFooter(),
            // ---- بيانات المستخدم + زرار الموقع ----
          ],
        ),
      ),
    );
  }
}
