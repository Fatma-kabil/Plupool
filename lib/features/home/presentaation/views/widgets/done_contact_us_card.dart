import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class DoneContactUsCard extends StatelessWidget {
  const DoneContactUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/done.svg',
            height: SizeConfig.h(150),
            width: SizeConfig.w(150),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // يحطهم في النص

            children: [
              SvgPicture.asset(
                'assets/icons/bi_stars.svg',
                height: SizeConfig.h(25),
                width: SizeConfig.w(25),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "شكرًا لتواصلك معنا",
                  style: AppTextStyles.styleSemiBold25(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          // ✅ الوصف يبدأ من اليمين
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "فريق PluPool استلم رسالتك، وسيتم التواصل معك\nفي أقرب وقت ممكن.",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: const Color(0xff808080), height: 1.7),
              textAlign: TextAlign.center, // محاذاة النص لليمين
              textDirection: TextDirection.rtl, // اتجاه النص عربي
            ),
          ),
        ],
      ),
    );
  }
}
