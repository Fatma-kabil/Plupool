import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_body.dart';
import 'package:plupool/features/auth/presentation/views/widgets/whatsapp_verification_note.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  bool showVerificationBody = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(22),
        vertical: SizeConfig.h(22),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'أدخل رقم الموبايل لتسجيل الدخول لحسابك',
              style: AppTextStyles.styleSemiBold20(context)
                  .copyWith(color: AppColors.ktextcolor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.h(40)),

            // 🟩 نموذج تسجيل الدخول
            LoginForm(
              formKey: _formKey,
              phoneController: phoneController,
            ),
            SizedBox(height: SizeConfig.h(15)),
            const WhatsappVerificationNote(),

            // 👇 هنا بنبدّل بين الزر وواجهة التحقق
            if (!showVerificationBody) ...[
              SizedBox(height: SizeConfig.h(100)),
              CustomTextBtn(
                width: double.infinity,
                text: 'إرسال رمز التحقق',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final phoneNumber = phoneController.text.trim();
                    debugPrint("📱 رقم الهاتف المدخل: $phoneNumber");
                    setState(() => showVerificationBody = true);
                  }
                },
              ),
              SizedBox(height: SizeConfig.h(180)),
            ] else ...[
              SizedBox(height: SizeConfig.h(40)),
              VerificationBody(phoneNumber: phoneController.text.trim()),
              SizedBox(height: SizeConfig.h(70)),
            ],

            // 🔵 أسفل الشاشة — التحويل إلى التسجيل
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
