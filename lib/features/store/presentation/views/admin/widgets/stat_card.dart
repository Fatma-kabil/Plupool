import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/data/models/dashboard_statu_model.dart';

class StatCard extends StatelessWidget {
  final DashboardStatModel model;

  const StatCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding:  EdgeInsets.symmetric(horizontal: S),
      decoration: BoxDecoration(
        color: model.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: model.iconColor),
            ),
            child: Icon(
              model.icon,
              color: model.iconColor,
              size: SizeConfig.w(18),
            ),
          ),
          SizedBox(width: SizeConfig.w(15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textDirection: TextDirection.ltr,
                model.value,
                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: AppColors.ktextcolor),
              ),
              SizedBox(height: SizeConfig.h(4)),
              Text(
                model.title,
                style: AppTextStyles.styleRegular14(
                  context,
                ).copyWith(color: Color(0xff555555)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
