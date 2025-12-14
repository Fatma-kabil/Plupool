import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
class CommentInput extends StatelessWidget {
  const CommentInput({super.key, required this.imageUrl});
  final String imageUrl;

  bool _isValidImage(String image) {
    return image.isNotEmpty &&
        image != 'string' &&
        image.startsWith('http');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// صورة البروفايل
        CircleAvatar(
          radius: SizeConfig.w(18),
          backgroundColor: Colors.grey[50],
          child: ClipOval(
            child: _isValidImage(imageUrl)
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: SizeConfig.w(34),
                    height: SizeConfig.w(34),
                    placeholder: (context, url) => Icon(
                      Icons.person,
                      size: SizeConfig.w(22),
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      size: SizeConfig.w(22),
                      color: AppColors.kprimarycolor,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: SizeConfig.w(22),
                    color: Colors.grey,
                  ),
          ),
        ),
        SizedBox(width: SizeConfig.w(12)),

        /// TextField
        Expanded(
          child: TextField(
            cursorColor: AppColors.kprimarycolor,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              isDense: true,
              hintText: "اكتب تعليقك هنا...",
              hintStyle: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: const Color(0xffBBBBBB)),
              contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(7),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xffD6D6D6),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xffD6D6D6),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xffD6D6D6),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: SizeConfig.w(12)),

        /// زر الإرسال
        Container(
          width: SizeConfig.w(35),
          height: SizeConfig.w(35),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff0077B6),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/Send.svg',
              width: SizeConfig.w(18),
              height: SizeConfig.w(18),
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
