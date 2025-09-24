
import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerConstructCard extends StatelessWidget {
  const CustomerConstructCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.h(150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Color(0xff0077B6), Color(0xff003450)],
        ),
      ),
      child: Stack(
        children: [
          // 🖼️ الصورة كخلفية جزئية
          Positioned(
            left: 20,
            top: 3,
            child: Image.asset(
              'assets/images/promocard2.png',
              height: SizeConfig.h(125),
              width: SizeConfig.w(125),
              fit: BoxFit.fill,
            ),
          ),
    
          // ✍️ النص فوق الصورة عادي
          Positioned(
            right: 10,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "تصميم ثلاثي الأبعاد",
                  style: AppTextStyles.styleBold16(context).copyWith(
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        blurRadius: 4,
                        color: Colors.black54,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  textDirection: TextDirection.rtl,
                  'شاهد حمامك قبل البناء مع تقنية التصميم\nثلاثي الأبعاد المتقدمة. اختر التصميم والألوان\nوالمواد بدقة عالية.',
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
