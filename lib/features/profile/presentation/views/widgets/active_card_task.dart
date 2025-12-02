import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';

class ActiveCardTask extends StatelessWidget {
  const ActiveCardTask({super.key, required this.request});
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
          Row(
            children: [
              Text(
                request.packageType ?? "",
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
                request.date,
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(6)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(18),
              vertical: SizeConfig.h(4),
            ),
            decoration: BoxDecoration(
              color: Color(0xffCDF7EC),
              borderRadius: BorderRadius.circular(SizeConfig.w(5)),
            ),
            child: Text(
              "نشطه",
              style: AppTextStyles.styleSemiBold13(
                context,
              ).copyWith(color: Color(0xff05B285)),
            ),
          ),
          SizedBox(height: SizeConfig.h(8)),
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: SizeConfig.w(12),
                color: Color(0xff999999),
              ),
              SizedBox(width: SizeConfig.w(4)),
              Text(
                'ينتهي في: ',
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
              Text(
               
                request.endTime ?? "",
                style: AppTextStyles.styleRegular13(
                  context,
                ).copyWith(color: Color(0xff999999)),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),
          ProgressSection(
            progress: request.progress!, // ده آمن دلوقتي عشان اتحققنا فوق
            visits: request.visits!,
          ),
          SizedBox(height: SizeConfig.h(12)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(12)),
            child: ReminderSection(request: request),
          ),
        ],
      ),
    );
  }
}
