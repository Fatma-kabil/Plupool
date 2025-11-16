import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class VerifiedBtn extends StatelessWidget {
  const VerifiedBtn({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //     height: SizeConfig.h(50),
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kprimarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.h(15)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(
                  Icons.task_alt,
                  size: SizeConfig.w(17),
                  color: Colors.white,
                ),
                SizedBox(width: SizeConfig.w(4)),
                Text(
                  "تأكيد الطلب",
                  style: AppTextStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
