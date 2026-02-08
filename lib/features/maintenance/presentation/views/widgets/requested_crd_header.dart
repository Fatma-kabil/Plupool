import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/maintenance/data/models/requested_maintenance_card_model.dart';
import 'package:plupool/features/visits/presentation/views/widgets/maintenance_date_row.dart';

class RequestedCardHeader extends StatelessWidget {
  const RequestedCardHeader({
    super.key,
    required this.model,
    required this.date,
    required this.time,
  });

  final RequestedMaintenanceCardModel model;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${model.role} ${model.name}",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            SizedBox(height: SizeConfig.h(5)),
            MaintenanceDateRow(date: date, time: time),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(5),
            horizontal: SizeConfig.w(15),
          ),
          decoration: BoxDecoration(
            color: model.statu == "جديد"
                ? Color(0xffCCE4F0)
                : Color(0xffD4D4D4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            model.statu,

            style: AppTextStyles.styleBold14(context).copyWith(
              color: model.statu == "جديد"
                  ? Color(0xff0077B6)
                  : Color(0xffA4A4A4),
            ),
          ),
        ),
      ],
    );
  }
}
