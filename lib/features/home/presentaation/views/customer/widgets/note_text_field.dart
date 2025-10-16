import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class NoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const NoteTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.kprimarycolor,
      controller: controller,
      maxLines: 5,
      textAlign: TextAlign.right,
      style: AppTextStyles.styleMedium16(
          context,
        ).copyWith(color: AppColors.ktextcolor),
        cursorHeight: SizeConfig.isWideScreen
            ? SizeConfig.w(12)
            : SizeConfig.h(20),
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(8),
        hint: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'أكتب ملاحظاتك هنا.....',
              style: AppTextStyles.styleRegular13(context)
                  .copyWith(color: AppColors.hintTextColor),
            ),
             SizedBox(width:SizeConfig.w(4) ),
            SvgPicture.asset('assets/icons/notes.svg',height: SizeConfig.h(16),width: SizeConfig.w(16),),
          ],
        ),
      ),
    );
  }
}
