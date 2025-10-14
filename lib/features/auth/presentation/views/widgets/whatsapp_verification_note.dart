import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class WhatsappVerificationNote extends StatelessWidget {
  const WhatsappVerificationNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        SvgPicture.asset(
          "assets/icons/whatsapp_icon.svg",

          height: SizeConfig.isWideScreen ? SizeConfig.h(17) : SizeConfig.w(17),
          width: SizeConfig.isWideScreen ? SizeConfig.h(17) : SizeConfig.w(17),
        ),
        SizedBox(width: SizeConfig.w(3)),
        Text(
          'سيتم إرسال كود التحقق عبر واتساب',
          style: AppTextStyles.styleSemiBold14(
            context,
          ).copyWith(color: Color(0xff05B285)),
        ),
      ],
    );
  }
}
