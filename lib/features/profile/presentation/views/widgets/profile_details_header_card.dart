import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/domain/entities/user_entity.dart';

class ProfileDetailsHeaderCard extends StatelessWidget {
  const ProfileDetailsHeaderCard({
    super.key,
    required this.model,
  });

  final UserEntity model;

  /// التحقق إن الصورة URL حقيقي وصالح
  bool _isValidImage(String? image) {
    if (image == null || image.trim().isEmpty) {
      return false;
    }

    final value = image.trim();

    // قيم الـ backend غير الصالحة
    if (value == 'string' ||
        value == 'null' ||
        value == 'undefined' ||
        value == 'file:///' ||
        value.startsWith('file:///')) {
      return false;
    }

    final uri = Uri.tryParse(value);

    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  /// الصورة الافتراضية
  /// فيها Border واحد فقط
  Widget _buildDefaultAvatar() {
    return Container(
      width: SizeConfig.w(75),
      height: SizeConfig.w(75),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.kprimarycolor,
          width: 1,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          "assets/icons/user.svg",
          width: SizeConfig.w(45),
          height: SizeConfig.w(45),
        ),
      ),
    );
  }

  /// تحويل الـ role للغة العربية
  String _getArabicRole(String role) {
    switch (role.toLowerCase()) {
      case 'technician':
        return 'فني';

      case 'company':
        return 'ممثل شركة أو مطور عقاري';

      case 'developer':
        return 'مطور';

      case 'pool_owner':
        return 'صاحب حمام سباحة';

      default:
        return role;
    }
  }

  /// صورة المستخدم لو موجودة
  Widget _buildNetworkImage(String imageUrl) {
    return Container(
      width: SizeConfig.w(74),
      height: SizeConfig.w(74),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF86C1E0),
          width: 2,
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: SizeConfig.w(70),
          height: SizeConfig.w(70),

          /// أثناء تحميل الصورة
          placeholder: (context, url) {
            return Container(
              width: SizeConfig.w(70),
              height: SizeConfig.w(70),
              color: Colors.white,
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/user.svg",
                  width: SizeConfig.w(38),
                  height: SizeConfig.w(38),
                ),
              ),
            );
          },

          /// لو الصورة فشلت
          errorWidget: (context, url, error) {
            // مهم:
            // هنا لا نرجع _buildDefaultAvatar()
            // عشان ما نعملش Border تاني.
            return Container(
              width: SizeConfig.w(70),
              height: SizeConfig.w(70),
              color: Colors.white,
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/user.svg",
                  width: SizeConfig.w(38),
                  height: SizeConfig.w(38),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = model.profileImage?.trim();

    final bool hasValidImage = _isValidImage(imageUrl);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(25),
      ),
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
          /// =========================
          /// Profile Image
          /// =========================
          hasValidImage
              ? _buildNetworkImage(imageUrl!)
              : _buildDefaultAvatar(),

          SizedBox(
            height: SizeConfig.h(10),
          ),

          /// =========================
          /// Name
          /// =========================
          Text(
            model.fullName,
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(
              color: AppColors.ktextcolor,
            ),
          ),

          /// =========================
          /// Role
          /// =========================
          Text(
            _getArabicRole(model.role),
            style: AppTextStyles.styleMedium20(
              context,
            ).copyWith(
              color: const Color(0xff555555),
            ),
          ),
        ],
      ),
    );
  }
}