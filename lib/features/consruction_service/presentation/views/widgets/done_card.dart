import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/core/utils/widgets/success_image.dart';

class DoneCard extends StatelessWidget {
  const DoneCard({super.key});
  

  @override
  Widget build(BuildContext context) {
     final double cardWidth = SizeConfig.screenWidth * 0.65; // 👈 يخليها 85% من عرض الشاشة
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(16) , vertical:SizeConfig.h(29) ),
      child: Container(
         width:SizeConfig.isWideScreen? cardWidth:double.infinity,
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.w(16) , vertical:SizeConfig.h(43) ),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SuccessImage(),
            SizedBox(height: 61,),
            HeaderText(
              title: 'تم استلام طلبك بنجاح!!',
              subtitle:
                  'سيقوم فريقنا بالتواصل معك في الوقت الذي اخترته. \nشكراً لاستخدامك PluPool',
            ),
          ],
        ),
      ),
    );
  }
}