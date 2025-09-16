import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/data/models/role_card_item.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.role, this.onTap});

  final RoleCardItemModel role;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(9),
        vertical: SizeConfig.w(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(1, 1),
          blurRadius: 1,
          spreadRadius: 0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // يبدأ من اليمين
            children: [
              // الأيقونة على اليمين
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.28),
                      offset: Offset(1, 1),
                      blurRadius: 4,
                       spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    role.icon,
                    color: AppColors.kprimarycolor,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      role.title,
                      textAlign: TextAlign.right, // يبدأ من اليمين
                      style: AppTextStyles.styleMedium20(context)
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role.subtitle,
                      textAlign: TextAlign.right, // يبدأ من اليمين
                      style: AppTextStyles.stylelight14(context),
                    ),
                  ],
                ),
              ),
            ].reversed.toList(), // <<< هنا العكس خلي الأيقونة على اليمين
          ),
        ),
      ),
    );
  }
}
