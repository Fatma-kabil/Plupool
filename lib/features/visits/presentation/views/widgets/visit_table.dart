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
              Container(width: 1, height: SizeConfig.h(25), color: Colors.grey),
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

          const Divider(),

          /// 🔹 Rows (Scrollable)
          SizedBox(
            height: SizeConfig.h(200),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                /// 🧠 Fake status logic (بدّليه بالـ API بعدين)
                final status = index.isEven
                    ? RequestStatus.completed
                    : RequestStatus.scheduled;

                final colors = RequestStatusColors.getColors(status);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'الزيارة #${index + 1}',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.styleSemiBold16(
                            context,
                          ).copyWith(color: Color(0xff555555)),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: SizeConfig.h(30),
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Center(
                          child: buildStatusLabel(colors, context, status),
                        ),
                      ),
                      Divider(height: 16, color: Colors.grey),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
