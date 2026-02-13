import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class TechDetails extends StatelessWidget {
  const TechDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomerInfoItem(
              crossAxisAlignment: CrossAxisAlignment.center,
              icon: Icons.calendar_month_outlined,
              title: "تاريخ الانضمام",
              value: "20/12/2025",
            ),
            SizedBox(height: 12),
            CustomerInfoItem(
                crossAxisAlignment: CrossAxisAlignment.start,
              icon: Icons.location_on,
              title: "العنوان",
              value: "مدينة نصر ، القاهرة",
            ),
          ],
        ),
       SizedBox(
          height: SizeConfig.h(90),
          child: const VerticalDivider(color: AppColors.textFieldBorderColor, thickness: 1),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomerInfoItem(
                crossAxisAlignment: CrossAxisAlignment.center,
              icon: Icons.workspace_premium,
              title: "عدد سنوات الخبره",
              value: "5 سنين خبره",
            ),
            SizedBox(height: 12),
            CustomerInfoItem(
                crossAxisAlignment: CrossAxisAlignment.center,
              icon: Icons.star_border_purple500_rounded,
              title: "التقييم",
              value: "4.5",
            ),
          ],
        ),
      ],
    );
  }
}
