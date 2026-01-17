import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class OfferCardFooter extends StatelessWidget {
  const OfferCardFooter({super.key, this.onPressed, this.delonPressed});
  final void Function()? onPressed;
   final void Function()? delonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed:onPressed,
          icon: Icon(
            Icons.edit_note,
            color: AppColors.kprimarycolor,
            size: SizeConfig.isWideScreen ? SizeConfig.w(20) : SizeConfig.w(24),
          ),
        ),
        IconButton(
          onPressed:delonPressed,
          icon: Icon(
            Icons.delete_outline_rounded,
            color: Color(0xffE63946),
            size: SizeConfig.isWideScreen ? SizeConfig.w(20) : SizeConfig.w(24),
          ),
        ),
      ],
    );
  }
}
