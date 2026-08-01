import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/format_date.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String type;
  final bool isRead;
  final void Function()? onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
    required this.isRead,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    switch (type) {
      case "product_offer":
        icon = Icons.shopping_bag_rounded;
        iconColor = const Color(0xffF7A9C4);
        break;

      case "service_offer":
        icon = Icons.local_offer_rounded;
        iconColor = const Color(0xff05B285);
        break;

      case "visit_reminder":
        icon = Icons.access_time_filled_rounded;
        iconColor = const Color(0xff00B4D8);
        break;

      case "general":
        icon = Icons.notifications_active_rounded;
        iconColor = const Color(0xff7B61FF);
        break;

      case "report":
      case "support_report":
        icon = Icons.report_problem_rounded;
        iconColor = const Color(0xffEA5A65);
        break;

      default:
        icon = Icons.notifications_none_rounded;
        iconColor = Colors.grey;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.h(14),
          horizontal: SizeConfig.w(14),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isRead
                ? AppColors.textFieldBorderColor
                : AppColors.kprimarycolor,
            width: isRead ? 1 : 1.5,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.isWideScreen
                  ? SizeConfig.h(22)
                  : SizeConfig.w(18),
              backgroundColor: iconColor.withOpacity(.15),
              child: Icon(
                icon,
                color: iconColor,
                size: SizeConfig.isWideScreen
                    ? SizeConfig.h(26)
                    : SizeConfig.w(22),
              ),
            ),
            SizedBox(width: SizeConfig.w(10)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (!isRead)
                        Container(
                          width: SizeConfig.w(8),
                          height: SizeConfig.w(8),
                          margin: EdgeInsets.only(left: SizeConfig.w(6)),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          title,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.styleSemiBold16(
                            context,
                          ).copyWith(
                            color: AppColors.ktextcolor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.h(4)),

                  Text(
                    subtitle,
                    style: AppTextStyles.styleRegular14(
                      context,
                    ).copyWith(
                      color: const Color(0xff999999),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(4)),

                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: SizeConfig.isWideScreen
                            ? SizeConfig.h(17)
                            : SizeConfig.w(17),
                        color: const Color(0xff777777),
                      ),
                      SizedBox(width: SizeConfig.w(4)),
                      Text(
                        formatArabicDate(time),
                        style: AppTextStyles.styleRegular13(
                          context,
                        ).copyWith(
                          color: const Color(0xff525252),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}