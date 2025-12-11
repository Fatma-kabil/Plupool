import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({super.key, required this.model, required this.role});

  final UserEntity model;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.w(17),
              backgroundColor: Colors.grey[200],
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: model.profileImage.isNotEmpty
                      ? model.profileImage
                      : '', // لو فاضية
                  fit: BoxFit.cover,
                  width: SizeConfig.w(34),
                  height: SizeConfig.w(34),
                  placeholder: (context, url) => Icon(
                    Icons.person,
                    size: SizeConfig.w(26),
                    color: Colors.grey,
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.person,
                    size: SizeConfig.w(17),
                    color: AppColors.kprimarycolor,
                  ),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.w(5)),

            Text(
              "أهلاً ${model.fullName.split(" ").first}",
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
            Icon(
              Icons.person,
              size: SizeConfig.w(15),

              color: AppColors.kprimarycolor,
            ),
            SizedBox(width: SizeConfig.w(2)),
            Text(
              role,
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: AppColors.kprimarycolor),
            ),
          ],
        ),
      ],
    );
  }
}
