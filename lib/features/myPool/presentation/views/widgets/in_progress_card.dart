import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';

class InProgressCard extends StatelessWidget {
  const InProgressCard({super.key, required this.request});
  final ServiceRequest request;

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
            request.packageType ?? "",
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
                  progress: request.progress!, // ده آمن دلوقتي عشان اتحققنا فوق
                  visits: request.visits!,
                ),
                SizedBox(height: SizeConfig.h(12)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(12)),
                  child: ReminderSection(request: request),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
