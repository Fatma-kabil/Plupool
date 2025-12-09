import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/contact_us_card.dart';
import 'package:plupool/features/home/presentaation/views/widgets/app_bar_details.dart';
import 'package:plupool/features/home/presentaation/views/widgets/notification_button.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class CustomerAppbar extends StatelessWidget {
  final UserEntity model;

  const CustomerAppbar({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔔 أيقونة الإشعارات
        NotificationButton(
          onTap: () {
            context.push('/customernotificationview');
          },
        ),
        SizedBox(width: SizeConfig.w(10)),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const Dialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.all(
                  20,
                ), // يتحكم في المسافة حوالين الدايلوج
                child: ContactUsCard(), // 👈 بيرجع الويدجت اللي فوق
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              border: Border.all(color: AppColors.kprimarycolor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(5),
                vertical: SizeConfig.h(5),
              ),
              child: GestureDetector(
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: AppColors.kprimarycolor,
                      size: SizeConfig.w(14),
                    ),
                    SizedBox(width: SizeConfig.w(2)),
                    Text(
                      'تواصل معنا',
                      style: AppTextStyles.styleBold13(
                        context,
                      ).copyWith(color: AppColors.kprimarycolor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const Spacer(),

        // 👤 النصوص + الصورة
        AppBarDetails(model: model),
      ],
    );
  }
}
