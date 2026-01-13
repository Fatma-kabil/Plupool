import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/data/models/dashboard_shortcut_model.dart';

class ShortcutButton extends StatelessWidget {
  final DashboardShortcutModel model;

  const ShortcutButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Container(
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.textFieldBorderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Container(
            padding: EdgeInsets.all(SizeConfig.w(6)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: model.color),
            ),
           child:  Icon(model.icon, color: model.color, size: SizeConfig.w(24))),
             SizedBox(width: SizeConfig.w(12)),
            Text(
              model.title,
              style: AppTextStyles.styleSemiBold16(context).copyWith(color:Color(0xff555555)),
            ),
          ],
        ),
      ),
    );
  }
}
