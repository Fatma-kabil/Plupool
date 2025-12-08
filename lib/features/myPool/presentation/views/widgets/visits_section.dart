import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';

class VisitsSection extends StatelessWidget {
  const VisitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: requests.length,
      itemBuilder: (context, index) {
        if (requests[index].status == RequestStatus.inProgress) {
          return Container(
            padding: EdgeInsets.all(SizeConfig.w(14)),
            decoration: BoxDecoration(
              //     color: Colors.white,
              borderRadius: BorderRadius.circular(SizeConfig.w(10)),
              border: Border.all(color: AppColors.textFieldBorderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      requests[index].packageType ?? "",
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    Spacer(),
                    Text(
                      "البدايه : ",
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    Text(
                      requests[index].date,
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
                      Icons.calendar_month,
                      size: SizeConfig.w(12),
                      color: Color(0xff999999),
                    ),

                    Text(
                      "2/5/2030",
                      style: AppTextStyles.styleRegular13(
                        context,
                      ).copyWith(color: Color(0xff999999)),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(8)),
                ProgressSection(
                  progress: 2, // ده آمن دلوقتي عشان اتحققنا فوق
                  visits: 6,
                ),
                SizedBox(height: SizeConfig.h(12)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(12)),
                  child: ReminderSection(request: requests[index]),
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
