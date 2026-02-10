import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String type;
  final void Function()? onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;

    switch (type) {
      case "offer":
        icon = Icons.local_offer_rounded;
        iconColor = const Color(0xffF7A9C4);
        break;

      case "reminder":
        icon = Icons.access_time_filled;
        iconColor = const Color(0xff00B4D8);
        break;

      case "report":
        icon = Icons.error_outline;
        iconColor = const Color(0xffEA5A65);
        break;

      case "order":
        icon = Icons.receipt_long_rounded;
        iconColor = const Color(0xff05B285);
        break;

      case "message":
        icon = Icons.chat_bubble_outline_rounded;
        iconColor = const Color(0xff0096B4);
        break;

      case "support":
        icon = Icons.support_agent_rounded;
        iconColor = const Color(0xff0096B4);
        break;

      default:
        icon = Icons.notifications_none;
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
          border: Border.all(color: AppColors.textFieldBorderColor),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.isWideScreen
                  ? SizeConfig.h(22)
                  : SizeConfig.w(18),
              backgroundColor: iconColor.withOpacity(0.15),
              child: Icon(
                icon,
                color: iconColor,
                size: SizeConfig.isWideScreen
                    ? SizeConfig.h(26)
                    : SizeConfig.w(22),
              ),
            ),
            SizedBox(width: SizeConfig.w(10)),
            // النصوص
            Expanded(
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textDirection: TextDirection.rtl,
                    title,
                    style: AppTextStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  SizedBox(height: SizeConfig.h(4)),
                  Text(
                    subtitle,
                    style: AppTextStyles.styleRegular14(
                      context,
                    ).copyWith(color: Color(0xff999999)),
                  ),
                  SizedBox(height: SizeConfig.h(4)),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: SizeConfig.isWideScreen
                            ? SizeConfig.h(17)
                            : SizeConfig.w(17),
                        color: Color(0xff777777),
                      ),
                      SizedBox(width: SizeConfig.w(4)),
                      Text(
                        time,
                        style: AppTextStyles.styleRegular13(
                          context,
                        ).copyWith(color: Color(0xff525252)),
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
