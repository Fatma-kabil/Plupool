import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// زر الإرسال (طائرة ورقية)
        Container(
          width: SizeConfig.w(39),
          height: SizeConfig.h(37),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff0077B6), // أزرق
          ),
          child: Center(
            // 🔹 هنا بيخلي الأيقونة تتوسّط
            child: SvgPicture.asset(
              'assets/icons/Send.svg',
              width: SizeConfig.w(18), // صغّري/كبّري على حسب اللي يظبط
              height: SizeConfig.h(18),
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),

        /// TextField
        Expanded(
          child: TextField(
            cursorColor: AppColors.kprimarycolor,
            textAlign: TextAlign.right,
    
            decoration: InputDecoration(
              isDense: true,
              
              hintText: "...اكتب تعليقك هنا",
              hintStyle: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: const Color(0xffBBBBBB)),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
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

        SizedBox(width: 12),

        /// صورة البروفايل
        const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage("assets/images/customer_user.png"),
        ),
      ],
    );
  }
}
