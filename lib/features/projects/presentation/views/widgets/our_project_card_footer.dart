import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class OurProjectCardFooter extends StatelessWidget {
  const OurProjectCardFooter({
    super.key,
    this.onEditPressed,
    this.onVisionPressed,
    this.ondelPressed,
  });
  final void Function()? onEditPressed;
  final void Function()? onVisionPressed;
  final void Function()? ondelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        IconButton(
          onPressed: onEditPressed,
          icon: Icon(
            Icons.edit_note,
            color: AppColors.kprimarycolor,
            size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(24),
          ),
        ),
                IconButton(
          onPressed: onVisionPressed,
          icon: Icon(
            Icons.visibility_outlined,
            color: Color(0xffFF9F1C),
            size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(24),
          ),
        ),
        IconButton(
          onPressed: ondelPressed,
          icon: Icon(
            Icons.delete_outline_rounded,
            color: Color(0xffE63946),
            size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(24),
          ),
        ),
      ],
    );
  }
}
