import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
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
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/success_frame.png",
                  width: SizeConfig.w(190),
                  height: SizeConfig.h(180),
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/check.png",
                  width: SizeConfig.w(122),
                  height: SizeConfig.h(122),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          const SizedBox(height: 59),

          // ✅ العنوان
          Center(
            child: Text('تم إعادة تعيين كلمة المرور بنجاح!',
              style: AppTextStyles.styleSemiBold25(context),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 8),

          // ✅ النص الوصفي
          Center(
            child: Text('يمكنك الآن تسجيل الدخول باستخدام كلمة المرور \nالجديدة الخاصة بك',
              textAlign: TextAlign.center,
              style: AppTextStyles.styleRegular16(context),
            ),
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
