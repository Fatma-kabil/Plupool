import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(SizeConfig.isWideScreen ? 30 : 15),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, SizeConfig.h(56)),
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // هنا تسجّل بجوجل
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: SizeConfig.w(8)),
                child: Image.asset(
                  'assets/images/google.png',
                  height: SizeConfig.h(20),
                  width: SizeConfig.w(20),
                ),
              ),
            ),
            Center(
              child: Text(
                "تسجيل بواسطة جوجل",
                style: AppTextStyles.styleMedium18(context).copyWith(
                  color: Color(0xff141F1F),
                  fontSize: SizeConfig.isWideScreen ? 25 : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
