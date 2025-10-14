import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>(); // نقلنا المفتاح هنا ✅
  final TextEditingController phoneController = TextEditingController(); // ✅

  @override
  void dispose() {
    phoneController.dispose(); // 🧹 تنظيف بعد الاستخدام
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.w(22),
        right: SizeConfig.w(22),
        bottom: SizeConfig.h(22),
        top: SizeConfig.h(22),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'أدخل رقم الموبايل لتسجيل الدخول لحسابك',
              style: AppTextStyles.styleSemiBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            LoginForm(formKey: _formKey, phoneController: phoneController),
            SizedBox(height: 15),
            WhatsappVerificationNote(),
            SizedBox(height: SizeConfig.h(100)),
            CustomTextBtn(
              width: double.infinity,
              text: 'إرسال رمز التحقق',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final phoneNumber = phoneController.text.trim();
                  print("📱 رقم الهاتف المدخل: $phoneNumber");

                  // 🟢 هنا استخدمي الرقم في الخطوة التالية
                  // sendOtp(phoneNumber);
                }
              },
            ),
            SizedBox(height: SizeConfig.h(180)),
            AuthSwitchRow(
              leadingText: ' ليس لدي حساب ',
              actionText: ' انشاء حساب',
              onTap: () {
                context.go('/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
