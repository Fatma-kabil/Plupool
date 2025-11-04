import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';

class PrivacyHeader extends StatelessWidget {
  const PrivacyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط الاتجاه العام
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // يخلي النصوص تبدأ من اليمين فعليًا
        children: [
          Text(
            "مرحبًا بك في PluPool 👋",
            style: AppTextStyles.styleBold16(context)
                .copyWith(color: AppColors.ktextcolor),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 10),
          Text(
            "نشكرك لاختيارك تطبيق PluPool لخدمات وصيانة حمامات السباحة.\n"
            "نحن ملتزمون بحماية خصوصيتك وتقديم خدمة متميزة تلبي توقعاتك.\n"
            "باستخدامك تطبيق PluPool ، فإنك توافق على الشروط والسياسات الموضحة في هذه الوثيقة. نرجو منك قراءتها بعناية.",
            style: AppTextStyles.styleRegular13(context)
                .copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
