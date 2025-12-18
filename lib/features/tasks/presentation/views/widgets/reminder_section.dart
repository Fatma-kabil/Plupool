import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ReminderSection extends StatelessWidget {
  const ReminderSection({super.key, required this.request});
  final dynamic request;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCCE4F0),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // مربع التذكير
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(15),
                vertical: SizeConfig.h(4),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF00B4D8),
                borderRadius: BorderRadius.circular(SizeConfig.w(10)),
              ),
              child: Text(
                "تذكير",
                style: AppTextStyles.styleBold10(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),

          // باقي المحتوى
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.w(15),
              top: SizeConfig.h(15),
              bottom: SizeConfig.h(15),
            ),

            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: Color(0xff55A4CE),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.w(8)),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: SizeConfig.w(18),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.w(6)),
                Expanded(
                  child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الزيارة القادمة",
                        style: AppTextStyles.styleMedium16(
                          context,
                        ).copyWith(color: AppColors.ktextcolor),
                      ),
                      SizedBox(height: SizeConfig.h(4)),
                      Text(
                        "${request.nextVisitDay ?? ''}   ${request.nextVisitDate ?? ''} - ${request.nextVisitTime ?? ''}",
                        style: AppTextStyles.styleRegular14(
                          context,
                        ).copyWith(color: Color(0xff777777)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
