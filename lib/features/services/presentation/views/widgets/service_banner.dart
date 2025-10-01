import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class ServiceBanner extends StatelessWidget {
  const ServiceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // عرض كامل
      //  height: 112, // نفس التصميم
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0077B6), // الأزرق الفاتح
            Color(0xFF003450), // الأزرق الغامق
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "بناء مسابح احترافية",
            style: AppTextStyles.styleBold20(
              context,
            ).copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 7),
          Text(
            "هندسة متخصصة، خامات عالية الجودة،\nوضمانات شاملة.",
            style: AppTextStyles.styleRegular16(
              context,
            ).copyWith(color: Colors.white, height: 1.4),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
