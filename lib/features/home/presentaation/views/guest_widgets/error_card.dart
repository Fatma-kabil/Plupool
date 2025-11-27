import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key, this.title, this.subtitle, this.color});
  final String? title;
  final String? subtitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(16) , vertical: SizeConfig.h(29)),
      child: Container(
        width: SizeConfig.isWideScreen?SizeConfig.screenWidth*0.65:double.infinity,
        padding:  EdgeInsets.only(
          left: SizeConfig.w(16),
          right: SizeConfig.w(16),
          bottom: SizeConfig.h(25),
          top: SizeConfig.h(20),
        ),
        decoration: BoxDecoration(
          color:color?? AppColors.kScaffoldColor,
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
            SizedBox(height: SizeConfig.h(7)),
            HeaderText(
              title:title?? 'تسجيل الدخول مطلوب',
              subtitle:subtitle??
                  'لإتمام عملية الحجز والاستفادة من خدمات PluPool، يرجى تسجيل الدخول أو إنشاء حساب جديد.',
            ),

            SizedBox(height: SizeConfig.h(30)),
            CustomTextBtn(
              width: double.infinity,
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
