
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileDetailsHeaderCard extends StatelessWidget {
  const ProfileDetailsHeaderCard({
    super.key,
    required this.name,
    required this.role,
    required this.image,
  });
  final String name;
  final String role;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.h(25)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(

         mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
            padding: const EdgeInsets.all(2), // سماكة البوردر
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF86C1E0), // الأزرق الأساسي
                width: 2,
              ),
            ),
            child:
          CircleAvatar(

            radius: SizeConfig.w(35),
            backgroundImage: AssetImage(image),
          ),),
          SizedBox(height: SizeConfig.h(10)),
          Text(
            name,
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          Text(
            role,
            style: AppTextStyles.styleMedium20(
              context,
            ).copyWith(color: Color(0xff555555)),
          ),
        ],
      ),
    );
  }
}
