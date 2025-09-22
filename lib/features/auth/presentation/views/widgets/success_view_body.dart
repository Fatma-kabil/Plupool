import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_back_button.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/core/utils/widgets/success_image.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24), // مسافة يمين وشمال
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // ✅ زر الرجوع
            const CustomBackButton(),

            const SizedBox(height: 100),

            // ✅ أيقونة النجاح (الإطار + الصح)
            Center(child: SuccessImage()),

            const SizedBox(height: 59),

            // ✅ العنوان
            HeaderText(
              title: 'تم إنشاء حسابك بنجاح',
              subtitle:
                  'جاهز تستكشف المزايا المخصصة ليك \nدلوقتي نكمل  ونجهز حسابك بالكامل',
            ),

            SizedBox(height: 41),

            // ✅ زر التالي
            CustomTextBtn(
              text: 'التالي',
              onPressed: () {
                // هنا تحط النافيجيشن اللي بعد النجاح
                context.push('/customersetup');
              },
            ),

            //   const SizedBox(height: 40), // مسافة من تحت
          ],
        ),
      ),
    );
  }
}
