import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/domain/entities/user_service_entity.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';

class InProgressCard extends StatelessWidget {
  const InProgressCard({super.key, required this.service});
  final UserServiceEntity service;

  @override
  Widget build(BuildContext context) {
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
          Text(
            service.title,
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(15)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
            child: Column(
              children: [
                ProgressSection(
                  progress: service.completedVisits, // ده آمن دلوقتي عشان اتحققنا فوق
                  visits: service.visitsCount,
                  status: RequestStatus.inProgress,
                  progressRatio:service.progressPercentage ,
                  
                ),
                SizedBox(height: SizeConfig.h(12)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(12)),
                  child: ReminderSection(date: service.nextMaintenanceDate??"",time: service.nextMaintenanceTime??""),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
