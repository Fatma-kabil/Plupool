import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/note_text_field.dart';

class DescriptionInputContainer extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final String? Function(String?)? validator;

  const DescriptionInputContainer({
    super.key,
    required this.controller,
    this.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(4),
        horizontal: SizeConfig.w(4),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: NoteTextField(
        validator: validator,
        controller: controller,
        text: text ?? "أدخل وصفاً تفصيلياً للعرض.....",
        hiystyle: AppTextStyles.styleRegular14(context)
            .copyWith(color: AppColors.hintTextColor),
        textStyle: AppTextStyles.styleRegular14(context)
            .copyWith(color: AppColors.ktextcolor),
        cursorColor: AppColors.ktextcolor,
      ),
    );
  }
}
