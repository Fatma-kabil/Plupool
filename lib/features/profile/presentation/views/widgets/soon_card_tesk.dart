import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/service_request_model.dart';

class SoonCardTesk extends StatelessWidget {
  const SoonCardTesk({super.key,required this.request});
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
                "البدايه: ",
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
              horizontal: SizeConfig.w(15),
              vertical: SizeConfig.h(4),
            ),
            decoration: BoxDecoration(
              color: Color(0xffFFECD2),
              borderRadius: BorderRadius.circular(SizeConfig.w(5)),
            ),
            child: Text(
              "قريباً",
              style: AppTextStyles.styleSemiBold13(
                context,
              ).copyWith(color: Color(0xffFF9F1C)),
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

        
        ],
      ),
    );
  }
}
