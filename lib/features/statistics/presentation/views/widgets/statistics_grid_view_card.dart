import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/statistics/data/models/statistics_model.dart';

class StatisticsGridViewCard extends StatelessWidget {
  const StatisticsGridViewCard({super.key,required this.model});
  final StatisticsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        //   horizontal: SizeConfig.w(32),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: model.backColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 1,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
           decoration: BoxDecoration(
            border: Border.all(color: model.iconColor, ),shape: BoxShape.circle
           ),
            child: Padding(
              padding:  EdgeInsets.all(SizeConfig.w(6)),
              child: Icon(
              model.icon,
                size: SizeConfig.w(24),
                color: model.iconColor,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(4)),
          Text(
            model.count.toString(),
            style: AppTextStyles.styleMedium20(
              context,
            ).copyWith(color: Color(0xff333333)),
          ),
            SizedBox(height: SizeConfig.h(6)),
          Text(
            model.title  ,
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: Color(0xff555555)),
          ),
        ],
      ),
    );
  }
}
