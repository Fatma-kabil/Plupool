import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// الكارد الأساسي
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 25),
          decoration: BoxDecoration(
            color: const Color(0xffCCE4F0), // لون الخلفية
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// النصوص
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mode Control",
                    style: AppTextStyles.styleMedium20(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
              //    const SizedBox(height: 8),
                  Text(
                    "✨ قادمة قريباً",
                    style: AppTextStyles.styleRegular16(
                      context,
                    ).copyWith(color: const Color(0xff777777)),
                  ),
                ],
              ),
              SizedBox(width: 10,),

              /// الأيقونة
              CircleAvatar(
                backgroundColor: const Color(0xff55A4CE),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: SizeConfig.w(24),
                ),
              ),
            ],
          ),
        ),

        /// الليبل الأزرق (قريباً)
        Positioned(
          top: 0, // يطلع فوق الكارد شويه
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xff00B4D8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("قريباً", style: AppTextStyles.styleBold10(context)),
          ),
        ),
      ],
    );
  }
}
