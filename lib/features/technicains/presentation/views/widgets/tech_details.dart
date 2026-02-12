import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class TechDetails extends StatelessWidget {
  const TechDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomerInfoItem(
                icon: Icons.calendar_month_outlined,
                title: "تاريخ الانضمام",
                value: "20/12/2025",
              ),
              SizedBox(height: 12),
              CustomerInfoItem(
                icon: Icons.location_on,
                title: "العنوان",
                value: "مدينة نصر ، القاهرة",
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(15)),
          child: Container(width: 1, color: Colors.grey,height: SizeConfig.h(80),),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomerInfoItem(
                icon: Icons.workspace_premium,
                title: "عدد سنوات الخبره",
                value: "5 سنين خبره",
              ),
              SizedBox(height: 12),
              CustomerInfoItem(
                icon: Icons.star_border_purple500_rounded,
                title: "التقييم",
                value: "4.5",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
