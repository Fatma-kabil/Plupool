import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kprimarycolor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(8),
          vertical: SizeConfig.h(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("إضافة ملاحظة", style: AppTextStyles.styleMedium16(context)),
            SizedBox(width: 2),
            Icon(Icons.add, color: AppColors.kprimarycolor,size: SizeConfig.w(18),),
          ],
        ),
      ),
    );
  }
}
