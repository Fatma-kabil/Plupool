import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16, bottom: 43,top: 20),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/error.svg',
              width: SizeConfig.w(137),
              height: SizeConfig.h(137),
            ),
            SizedBox(height: 7),
            HeaderText(
              title: 'تسجيل الدخول مطلوب',
              subtitle:
                  'لإتمام عملية الحجز والاستفادة من خدمات PluPool، يرجى تسجيل الدخول أو إنشاء حساب جديد.',
            ),

             SizedBox(height: 53),
            CustomTextBtn(
              text: 'تسجيل الدخول',
              onPressed: () {
                context.go('/login');
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
