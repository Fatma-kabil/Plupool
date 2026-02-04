import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/build_statue_label.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';

class VisitsTable extends StatelessWidget {
  const VisitsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(4),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          /// 🔹 Header
          Row(
            children: [
              Expanded(
                child: Text(
                  'رقم الزيارة',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
              ),
              Container(width: SizeConfig.w(1), height: SizeConfig.h(25), color: AppColors.textFieldBorderColor),
              Expanded(
                child: Text(
                  'الحالة',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
              ),
            ],
          ),

          const Divider(color: AppColors.textFieldBorderColor),

          /// 🔹 Rows (Scrollable)
          SizedBox(
            height: SizeConfig.h(200),
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (_, __) => Divider(color: AppColors.textFieldBorderColor),
              itemBuilder: (context, index) {
                final status = index.isEven
                    ? RequestStatus.completed
                    : RequestStatus.scheduled;

                final colors = RequestStatusColors.getColors(status);

                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        'الزيارة #${index + 1}',
                        textAlign: TextAlign.center,
                         style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                      ),
                    ),
                    Container(
                      width:SizeConfig.w(1) ,
                      height: SizeConfig.h(35),
                      color: AppColors.textFieldBorderColor,
                    ),
                    Expanded(
                      child: Center(
                        child: buildStatusLabel(colors, context, status),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
