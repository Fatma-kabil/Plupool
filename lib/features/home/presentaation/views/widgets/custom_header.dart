import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/header_model.dart';

class CustomHeader extends StatelessWidget {
  final HeaderModel model;

  const CustomHeader({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔔 أيقونة الإشعارات
        GestureDetector(
          onTap: model.onNotificationTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              child: Center(
                child: SvgPicture.asset(
                  model.notificationIcon,
                  width: SizeConfig.w(19),
                  height: SizeConfig.h(19),
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
                  "أهلاً ${model.username}",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.ktextcolor),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: SizeConfig.w(17),
                  backgroundImage: AssetImage(model.avatarUrl),
                ),
              ],
            ),
            SizedBox(height: 2),
            //    const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  model.subtitle,
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: AppColors.kprimarycolor),
                ),
                const SizedBox(width: 2),
                SvgPicture.asset(
                  "assets/icons/user.svg",
                  width: SizeConfig.w(18),
                  height: SizeConfig.h(18),
                  color: AppColors.kprimarycolor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
