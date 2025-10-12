import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/metric_card.dart';

class TechInfoCardRow extends StatelessWidget {
  const TechInfoCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: MetricCard(
            icon: "assets/icons/tasks.svg", // شحن/توصيل
            value: "119",
            label: 'مهام مكتملة',
          ),
        ),

         SizedBox(width:SizeConfig.w(6) ),

        Expanded(
          flex: 1,
          child: MetricCard(
            icon: "assets/icons/week_tasks.svg", // منتج/صندوق
            value: "10",
            label: 'مهام الأسبوع',
          ),
        ),

        SizedBox(width:SizeConfig.w(6) ),


        Expanded(
          flex: 1,
          child: MetricCard(
            icon: "assets/icons/Rating.svg", // تقييم
            value: "4.8",
            label: 'التقييم',
          ),
        ),
      ],
    );
  }
}