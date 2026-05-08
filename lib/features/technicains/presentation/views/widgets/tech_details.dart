import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/functions/normalize_arabic_numbers_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/domain/entities/user_entity.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info_item.dart';

class TechDetails extends StatelessWidget {
  const TechDetails({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            CustomerInfoItem(
              crossAxisAlignment: CrossAxisAlignment.center,
              icon: Icons.calendar_month_outlined,
              title: "تاريخ الانضمام",
              value: formatDate(user.createdAt),
            ),
            SizedBox(height: 12),
            CustomerInfoItem(
              crossAxisAlignment: CrossAxisAlignment.start,
              icon: Icons.location_on,
              title: "العنوان",
              value: user.address??"لا يوجد",
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.h(90),
          child: const VerticalDivider(
            color: AppColors.textFieldBorderColor,
            thickness: 1,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            CustomerInfoItem(
              crossAxisAlignment: CrossAxisAlignment.center,
              icon: Icons.workspace_premium,
              title: "عدد سنوات الخبره",
             value: (user.yearsOfExperience == null || user.yearsOfExperience == 0)
    ? "لا توجد سنوات خبرة"
    : "${toArabicNumbers(user.yearsOfExperience.toString())} سنوات",
            ),
            SizedBox(height: 12),
            CustomerInfoItem(
              crossAxisAlignment: CrossAxisAlignment.center,
              icon: Icons.star_border_purple500_rounded,
              title: "التقييم",
              value:toArabicNumbers( user.totalRating.toString()),
            ),
          ],
        ),
      ],
    );
  }
}
