import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/services/presentation/views/widgets/more_details_row.dart';

class CustomerConstructCard extends StatelessWidget {
  const CustomerConstructCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.h(150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        color: Color(0xffCCE4F0),
      ),
      child: Stack(
        children: [
          // 🖼️ الصورة كخلفية جزئية
          Positioned(
            left: 15,
            top: 15,
            child: Image.asset(
              'assets/images/promocard2.png',
              height: SizeConfig.h(125),
              width: SizeConfig.w(125),
              fit: BoxFit.fill,
            ),
          ),

          // ✍️ النص فوق الصورة عادي
          Positioned(
            right: 15,
            top: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "تصميم ثلاثي الأبعاد",
                  style: AppTextStyles.styleBold16(
                    context,
                  ).copyWith(color: Colors.black),
                ),
                const SizedBox(height: 8),
                Text(
                  textDirection: TextDirection.rtl,
                  'شاهد حمامك قبل البناء مع تقنية التصميم\nثلاثي الأبعاد المتقدمة. اختر التصميم والألوان\nوالمواد بدقة عالية.',
                  style: AppTextStyles.styleRegular13(
                    context,
                  ).copyWith(color: Color(0xff777777)),
                ),
                SizedBox(height: 10),
                MoreDetailsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
