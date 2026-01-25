import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_outlined_btn.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';

class AddEditOfferViewFooter extends StatelessWidget {
  const AddEditOfferViewFooter({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextBtn(
          text: text,
          onPressed: onPressed,
          width: SizeConfig.w(140),
          padding: SizeConfig.h(7),
          textStyle: AppTextStyles.styleBold16(
                  context,
                ).copyWith(color: Colors.white),
        ),

        CustomOutlinedBtn(
          text: 'إلغاء',

          width: SizeConfig.w(140),
        ),
      ],
    );
  }
}
