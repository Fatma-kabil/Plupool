import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CardFooterButton extends StatelessWidget {
  const CardFooterButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor, required this.icon,
  });
  final String text;
  final Color color;
  final Color textColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:SizeConfig.w(120) ,
     
      decoration: BoxDecoration( color: color,
      borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.h(8)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: textColor),
            ),
            SizedBox(width: SizeConfig.w(2),),
            Icon(icon,color: textColor,size: SizeConfig.w(17),),
          ],
        ),
      ),
    );
  }
}
