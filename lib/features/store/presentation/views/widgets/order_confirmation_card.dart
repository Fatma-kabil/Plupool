import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class OrderConfirmationCard extends StatelessWidget {
  const OrderConfirmationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(29),
      ),
      child: Container(
        width: SizeConfig.isWideScreen
            ? SizeConfig.screenWidth * 065
            : double.infinity,
        padding: EdgeInsets.only(
          left: SizeConfig.w(16),
          right: SizeConfig.w(16),
          bottom: SizeConfig.h(25),
          top: SizeConfig.h(20),
        ),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/done.svg',
              width: SizeConfig.w(173),
              height: SizeConfig.h(173),
            ),
            SizedBox(height: SizeConfig.h(12)),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 6),
                Text(
                  textDirection: TextDirection.rtl,
                  "تم تأكيد طلبك بنجاح!",
                  style: AppTextStyles.styleSemiBold25(
                    context,
                  ).copyWith(color: Color(0xff333333)),
                ),
                SizedBox(width: SizeConfig.w(4)),
                Icon(Icons.auto_awesome, size: SizeConfig.w(38),color:Color(0xffFFBF68) ,),
              ],
            ),

             SizedBox(height:  SizeConfig.h(8)),

            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delivery_dining_sharp, size: SizeConfig.w(19), color: Color(0xff555555)),
                SizedBox(width:  SizeConfig.w(6)),
                Text(
                  "وقت التوصيل المتوقع",
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: Color(0xff808080)),
                ),
              ],
            ),

             SizedBox(height:SizeConfig.h(8) ),

            // ⏱ Expected days
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(Icons.access_time, size: SizeConfig.w(19), color: Color(0xff555555)),
                SizedBox(width:  SizeConfig.w(6)),
                Text(
                  "خلال 2 - 3 أيام",
                  style: AppTextStyles.styleMedium16(
                    context,
                  ).copyWith(color: Color(0xff808080)),
                ),
              ],
            ),

            SizedBox(height:SizeConfig.h(20) ),

            // 📝 Footer Text
             Text(
              "سنتواصل معك قريباً لتأكيد موعد التوصيل",
              textAlign: TextAlign.center,
              style: AppTextStyles.styleMedium16(context).copyWith(color: Color(0xff555555)),
            ),
          ],
        ),
      ),
    );
  }
}
