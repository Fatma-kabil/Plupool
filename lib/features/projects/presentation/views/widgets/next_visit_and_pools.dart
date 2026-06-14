import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/domain/entities/company_project_entity.dart';

class NextVisitAndPools extends StatelessWidget {
  const NextVisitAndPools({super.key, required this.project});

  final CompanyProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final statu = mapApiStatus(project.status!);
    final colors = RequestStatusColors.getColors(statu);

  //  final finishedPools = project. ?? 0;
    final totalPools = project.poolCount ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'عدد المسابح',
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),
            SizedBox(height: SizeConfig.h(4)),
            Row(
              children: [
                Icon(
                  Icons.pool,
                  size: SizeConfig.w(15),
                  color: Color(0xff555555),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Text(
                 toArabicNumbers ("${2}/$totalPools"),
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Color(0xff555555)),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: SizeConfig.h(12)),

        Text(
          'مستوى التنفيذ',
          style: AppTextStyles.styleSemiBold13(
            context,
          ).copyWith(color: const Color(0xff2B2B2B)),
        ),

        SizedBox(height: SizeConfig.h(8)),

        Row(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final progressRatio =
                      totalPools > 0
                          ? project.progressPercentage! / 100
                          : 0.0;

                  final barWidth =
                      progressRatio * constraints.maxWidth;

                  return ClipRRect(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.w(10)),
                    child: Stack(
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

                        if (project.progressPercentage! > 0)
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

                        if (project.progressPercentage == 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: SizeConfig.w(8),
                              height: SizeConfig.h(12),
                              decoration: BoxDecoration(
                                color: colors['progbar'],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(width: SizeConfig.w(30)),

            Text(
             toArabicNumbers( "${project.progressPercentage} %"),
              style: AppTextStyles.styleBold14(
                context,
              ).copyWith(color: colors['labelText']),
            ),
          ],
        ),
      ],
    );
  }
}