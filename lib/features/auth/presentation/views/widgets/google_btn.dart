import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key, this.onTap});
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // background: #FFF
          borderRadius: BorderRadius.circular(10), // border-radius: 10px
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.17), // rgba(0, 0, 0, 0.17)
              offset: const Offset(0, 1), // 0 1px (X, Y)
              blurRadius: 3, // 3px blur
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // لو حابة Padding داخلي
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/google.png', // تأكدي من مسار الصورة
                width: SizeConfig.w(24), // width: 24px
            //    height: SizeConfig.h(24),
              ),
              const SizedBox(width: 12), // مسافة بين الأيقونة والنص
              Text(
                'استخدام حساب جوجل',
                style: AppTextStyles.styleMedium16(
                  context,
                ).copyWith(color: Color(0x8A000000)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
