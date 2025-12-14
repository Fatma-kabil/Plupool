import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';
class ProfileDetailsHeaderCard extends StatelessWidget {
  const ProfileDetailsHeaderCard({super.key, required this.model});
  final UserEntity model;

  bool _isValidImage(String image) {
    return image.isNotEmpty &&
        image != 'string' &&
        image.startsWith('http');
  }

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
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF86C1E0),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: SizeConfig.w(35),
              backgroundColor: Colors.grey[50],
              child: ClipOval(
                child: _isValidImage(model.profileImage)
                    ? CachedNetworkImage(
                        imageUrl: model.profileImage,
                        fit: BoxFit.cover,
                        width: SizeConfig.w(70),
                        height: SizeConfig.w(70),
                        placeholder: (context, url) => Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: SizeConfig.w(45),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.person,
                          color: AppColors.kprimarycolor,
                          size: SizeConfig.w(45),
                        ),
                      )
                    : Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: SizeConfig.w(45),
                      ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(10)),
          Text(
            model.fullName,
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          Text(
            model.role == 'pool_owner'
                ? 'صاحب حمام سباحة'
                : model.role == 'technician'
                    ? 'فني'
                    : 'مطور عقاري',
            style: AppTextStyles.styleMedium20(
              context,
            ).copyWith(color: const Color(0xff555555)),
          ),
        ],
      ),
    );
  }
}
