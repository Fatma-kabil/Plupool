import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DeleteAccountDoneCard extends StatelessWidget {
  const DeleteAccountDoneCard({super.key});

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
            ? SizeConfig.screenWidth * 0.65
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
              width: SizeConfig.w(120),
              height: SizeConfig.h(120),
            ),

            SizedBox(height: SizeConfig.h(30)),
            Text(
              'تم حذف الحساب بنجاح.',
              style: AppTextStyles.styleSemiBold25(
                context,
              ).copyWith(color: AppColors.ktextcolor),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),

            SizedBox(height: SizeConfig.h(20)),

            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.kprimarycolor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // 1️⃣ قفل الـ dialog الحالي
                Navigator.of(context).pop();

                // 2️⃣ الانتقال للصفحة الرئيسية بعد قفل الـ dialog
                Future.delayed(const Duration(milliseconds: 100), () {
                  context.go('/MainHomeTechView');
                });
              },

              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.isWideScreen
                      ? SizeConfig.h(8)
                      : SizeConfig.h(0),
                ),
                child: Text(
                  " العودة للصفحة الرئيسية",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.kprimarycolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
