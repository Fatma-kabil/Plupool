import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class GuestAppbar extends StatelessWidget {
  final String role;
  const GuestAppbar({super.key, required this.role});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔔 أيقونة الإشعارات

        // 👤 النصوص + الصورة
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.kprimarycolor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(4),
                      vertical: SizeConfig.w(4),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/user.svg",
                      width: SizeConfig.w(18),
                      height: SizeConfig.w(18),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.w(5)),
                Text(
                  "مستخدم123",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.h(2)),
            //    const SizedBox(height: 4),
            Row(
              children: [
                SizedBox(width: SizeConfig.w(12)),
                Text(
                  role,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: AppColors.kprimarycolor),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),

        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              border: Border.all(color: AppColors.kprimarycolor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.h(6),
                horizontal: SizeConfig.w(8),
              ),
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
      ],
    );
  }
}
