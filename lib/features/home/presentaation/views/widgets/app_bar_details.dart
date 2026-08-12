import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({
    super.key,
    required this.model,
  });

  final UserEntity model;

  bool _isValidImage(String image) {
    return image.isNotEmpty &&
        image != 'string' &&
        image.startsWith('http');
  }

  String _getArabicRole(String role) {
    switch (role.toLowerCase()) {
      case 'technician':
        return 'فني';

      case 'company':
        return 'ممثل شركة';

      case 'developer':
        return 'مطور';

      case 'pool_owner':
        return 'مالك حمام سباحة';

      default:
        return role;
    }
  }

  Widget _buildDefaultAvatar() {
    return Container(
      width: SizeConfig.w(34),
      height: SizeConfig.w(34),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.kprimarycolor,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          "assets/icons/user.svg",
          width: SizeConfig.w(20),
          height: SizeConfig.w(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.w(17),
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: _isValidImage(model.profileImage)
                    ? CachedNetworkImage(
                        imageUrl: model.profileImage,
                        fit: BoxFit.cover,
                        width: SizeConfig.w(34),
                        height: SizeConfig.w(34),

                        // أثناء تحميل الصورة
                        placeholder: (context, url) {
                          return _buildDefaultAvatar();
                        },

                        // لو الصورة مش موجودة أو حصل Error
                        errorWidget: (context, url, error) {
                          return _buildDefaultAvatar();
                        },
                      )
                    : _buildDefaultAvatar(),
              ),
            ),

            SizedBox(width: SizeConfig.w(5)),

            Text(
              "أهلاً ${model.fullName.split(" ").first}",
              style: AppTextStyles.styleSemiBold16(
                context,
              ).copyWith(
                color: AppColors.ktextcolor,
              ),
            ),
          ],
        ),

        SizedBox(height: SizeConfig.h(2)),

        Row(
          children: [
            Icon(
              Icons.person,
              size: SizeConfig.w(15),
              color: AppColors.kprimarycolor,
            ),
            SizedBox(width: SizeConfig.w(2)),
            Text(
              _getArabicRole(model.role),
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(
                color: AppColors.kprimarycolor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}