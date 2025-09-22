import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/header_text.dart';
import 'package:plupool/core/utils/widgets/success_image.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_back_button.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_btn.dart';

class NewPasswordSuccesViewBody extends StatelessWidget {
  const NewPasswordSuccesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // ✅ زر الرجوع
          const CustomBackButton(),

          const SizedBox(height: 100),

          // ✅ أيقونة النجاح (الإطار + الصح)
          SuccessImage(),

          const SizedBox(height: 59),
          HeaderText(
            title: 'تم إعادة تعيين كلمة المرور بنجاح!',
            subtitle:
                'يمكنك الآن تسجيل الدخول باستخدام كلمة المرور \nالجديدة الخاصة بك',
          ),

          SizedBox(height: 41),

          // ✅ زر التالي
          CustomTextBtn(
            text: 'التالي',
            onPressed: () {
              // هنا تحط النافيجيشن اللي بعد النجاح
              // context.push('/customersetup');
            },
          ),

          //   const SizedBox(height: 40), // مسافة من تحت
        ],
      ),
    );
  }
}
