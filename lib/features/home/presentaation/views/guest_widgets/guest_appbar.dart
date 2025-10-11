import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/widgets/notification_button.dart';
class GuestAppbar extends StatelessWidget {
  final String role;
  const GuestAppbar({super.key, required this.role});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔔 أيقونة الإشعارات
      NotificationButton(),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              border: Border.all(color: AppColors.kprimarycolor),
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  context.push('/login');
                },
                child: Text(
                  ' تسجيل دخول',
                  style: AppTextStyles.styleBold13(
                    context,
                  ).copyWith(color: AppColors.kprimarycolor),
                ),
              ),
            ),
          ),
        ),

        const Spacer(),

        // 👤 النصوص + الصورة
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  "مستخدم123",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(width: SizeConfig.w(5)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.kprimarycolor),
                  ),
                  child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(4) , vertical: SizeConfig.h(4)),
                    child: SvgPicture.asset(
                      "assets/icons/user.svg",
                      width: SizeConfig.w(18),
                      height: SizeConfig.w(18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            //    const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  role,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: AppColors.kprimarycolor),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
