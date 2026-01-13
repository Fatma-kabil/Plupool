import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/profile/data/models/project_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';

class MyProjectCard extends StatelessWidget {
  const MyProjectCard({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final colors = RequestStatusColors.getColors(project.status);
    return Container(
      padding: EdgeInsets.all(SizeConfig.w(14)),
      decoration: BoxDecoration(
        color: colors['bg'],
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
        border: Border.all(color: colors['border']),
      ),
      child: Column(
        children: [
          Row(
 
           children: [
              Text(
                project.title,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(10),
                  vertical: SizeConfig.h(4),
                ),
                decoration: BoxDecoration(
                  color: colors['labelBg'],
                  borderRadius: BorderRadius.circular(SizeConfig.w(5)),
                ),
                child: Text(
                  getStatusText(project.status),
                  style: AppTextStyles.styleSemiBold13(
                    context,
                  ).copyWith(color: colors['labelText']),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(2)),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: SizeConfig.w(15),
                color: Color(0xff999999),
              ),
              SizedBox(height: SizeConfig.w(2)),
              Text(
                project.location,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(6)),
          Row(
            children: [
              Icon(
                Icons.pool,
                size: SizeConfig.w(15),
                color: Color(0xff999999),
              ),
              SizedBox(width: SizeConfig.w(2)),
              Text(
                "عدد المسابح : ${project.nofpools}",
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(10)),
          Row(
            children: [
              Text(
                "الإنجاز: ${project.progress}%",
                style: AppTextStyles.styleBold13(
                  context,
                ).copyWith(color: colors['labelText']),
              ),

              SizedBox(width: SizeConfig.w(8)),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final progress = project.progress ?? 0;
                    final barWidth = progress / 100 * constraints.maxWidth;

                    return Stack(
                      children: [
                        // الخلفية الرمادية
                        Container(
                          height: SizeConfig.h(8),
                          decoration: BoxDecoration(
                            color: const Color(0xffD4D4D4),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.w(10),
                            ),
                          ),
                        ),

                        // الجزء الملوّن يظهر فقط لو progress > 0
                        if (progress > 0)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: SizeConfig.h(8),
                              width: barWidth,
                              decoration: BoxDecoration(
                                color: colors['labelText'],
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.w(10),
                                ),
                              ),
                            ),
                          ),

                        // الدايرة تظهر فقط لو progress == 0
                        if (progress == 0)
                          Positioned(
                            right: 0, // دايرة في بداية الخط
                            top: 0,
                            bottom:0,
                            child: Container(
                              width:  SizeConfig.w(8),
                              height: SizeConfig.h(12),
                              decoration: BoxDecoration(
                                color: colors['labelText'],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(width: SizeConfig.w(25)),
            ],
          ),

          //  ProgressSection()
          if (project.nextVisitDay != null) ...[
            SizedBox(height: SizeConfig.h(12)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
              child: ReminderSection(request: project),
            ),
          ],
        ],
      ),
    );
  }
}
