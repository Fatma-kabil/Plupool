import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DoneContactUsCard extends StatelessWidget {
  const DoneContactUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = SizeConfig.screenWidth * 0.72; // 👈 يخليها 85% من عرض الشاشة

    return Container(
      width:SizeConfig.isWideScreen? cardWidth:double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(27),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/done.svg',
            height: SizeConfig.h(150),
            width: SizeConfig.w(150),
          ),
          SizedBox(height: SizeConfig.h(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/bi_stars.svg',
                height: SizeConfig.h(25),
                width: SizeConfig.w(25),
              ),
               SizedBox(width:SizeConfig.w(6) ),
              Text(
                "شكرًا لتواصلك معنا",
                style: AppTextStyles.styleSemiBold25(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
           SizedBox(height: SizeConfig.w(8)),
          Text(
            "فريق PluPool استلم رسالتك، وسيتم التواصل معك\nفي أقرب وقت ممكن.",
            style: AppTextStyles.styleMedium16(context).copyWith(
              color: const Color(0xff808080),
              height: 1.7,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
