// widgets/info_cards_row.dart
import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import '../../../../../core/utils/widgets/metric_card.dart';

class InfoCardsRow extends StatelessWidget {
  const InfoCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Expanded(
          flex: 1,
          child: MetricCard(
            icon: "assets/icons/Rating.svg", // تقييم
            value: "4.8",
            label: 'التقييم',
          ),
        ),
       
         SizedBox(width:SizeConfig.w(5) ),

        Expanded(
          flex: 1,
          child: MetricCard(
            icon: "assets/icons/product.svg", // منتج/صندوق
            value: "+150",
            label: 'منتج',
          ),
        ),

       SizedBox(width:SizeConfig.w(5) ),
        Expanded(
          flex: 1,
          child: MetricCard(
            icon: "assets/icons/track.svg", // شحن/توصيل
            value: "24 H",
            label: 'توصيل',
          ),
        ),

       
      ],
    );
  }
}
