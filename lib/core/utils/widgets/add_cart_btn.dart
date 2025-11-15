import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AddCartBtn extends StatelessWidget {
  const AddCartBtn({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kprimarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          padding: EdgeInsets.symmetric(vertical: SizeConfig.h(4)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl, // الأيقونة يمين
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: SizeConfig.w(18),
            ),
            SizedBox(width:SizeConfig.w(8) ),
            Text(
              "أضف إلى السلة",
              style: AppTextStyles.styleMedium16(context)
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
