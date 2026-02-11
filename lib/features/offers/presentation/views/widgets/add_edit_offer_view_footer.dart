import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class AddEditOfferViewFooter extends StatelessWidget {
  const AddEditOfferViewFooter({super.key, this.onPressed, required this.text, this.buttonWidth});
  final void Function()? onPressed;
  final String text;
  final double? buttonWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextBtn(
          text: text,
          onPressed: onPressed,
          width: buttonWidth ?? SizeConfig.w(140),
          padding: SizeConfig.isWideScreen ? SizeConfig.h(10) : SizeConfig.h(7),
          textStyle: AppTextStyles.styleBold16(
            context,
          ).copyWith(color: Colors.white),
        ),

        CustomOutlinedBtn(
          text: 'إلغاء',
          padding: SizeConfig.isWideScreen ? SizeConfig.h(10) : SizeConfig.h(7),
          width: buttonWidth ?? SizeConfig.w(140),
        ),
      ],
    );
  }
}
