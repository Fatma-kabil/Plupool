import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/statistics/data/models/dashboard_item.dart';

class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
        //  color: Colors.white,
      ),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.iconBgColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.w(6)),
              child: Icon(
                item.icon,
                color: item.iconColor,
                size: SizeConfig.w(24),
              ),
            ),
          ),
            SizedBox(width: SizeConfig.w(6)),
          // Text
          Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.count.toString(),
                style: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(height: SizeConfig.h(6)),
              Text(
                item.title,
                style: AppTextStyles.styleRegular14(
                  context,
                ).copyWith(color: Color(0xff555555)),
              
              ),
            ],
          ),

          // Icon
        ],
      ),
    );
  }
}
