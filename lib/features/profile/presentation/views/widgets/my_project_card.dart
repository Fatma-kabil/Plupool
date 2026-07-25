import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/domain/entities/company_project_entity.dart';

class MyProjectCard extends StatelessWidget {
  const MyProjectCard({
    super.key,
    required this.project,
  });

  final CompanyProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final status = mapApiStatus(project.status);
    final colors = RequestStatusColors.getColors(status);

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
                project.projectName,
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              const Spacer(),
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
                  getStatusText(status),
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
                color: const Color(0xff999999),
              ),
              SizedBox(width: SizeConfig.w(2)),
              Text(
                project.location,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: const Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(6)),
          Row(
            children: [
              Icon(
                Icons.pool,
                size: SizeConfig.w(15),
                color: const Color(0xff999999),
              ),
              SizedBox(width: SizeConfig.w(2)),
              Text(
                "عدد المسابح : ${project.poolsCount}",
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: const Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(10)),
          Row(
            children: [
              Text(
                "الإنجاز: ${project.completionPercentage}%",
                style: AppTextStyles.styleBold13(
                  context,
                ).copyWith(color: colors['labelText']),
              ),
              SizedBox(width: SizeConfig.w(8)),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final progress = project.completionPercentage;
                    final barWidth =
                        progress / 100 * constraints.maxWidth;

                    return Stack(
                      children: [
                        Container(
                          height: SizeConfig.h(8),
                          decoration: BoxDecoration(
                            color: const Color(0xffD4D4D4),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.w(10),
                            ),
                          ),
                        ),
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
                        if (progress == 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: SizeConfig.w(8),
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

          // لو رجعتي nextVisit في الـ Entity فكّي الكومنت عن الجزء ده
          /*
          if (project.nextVisit != null) ...[
            SizedBox(height: SizeConfig.h(12)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
              child: ReminderSection(request: project),
            ),
          ],
          */
        ],
      ),
    );
  }
}