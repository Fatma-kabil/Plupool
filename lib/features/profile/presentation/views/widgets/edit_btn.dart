import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, this.onPressed});
  final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.h(46),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon:  Icon(Icons.edit_document, color: Colors.white,size:SizeConfig.w(18),),
        label:  Text(
          'تعديل المعلومات',
          style: AppTextStyles.styleSemiBold16(context).copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kprimarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
