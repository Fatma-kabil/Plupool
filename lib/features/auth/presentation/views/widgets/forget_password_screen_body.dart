import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendResetCode() {
    if (_formKey.currentState?.validate() ?? false) {
      // هنا هتحطي اللوجيك لإرسال كود التحقق
      debugPrint('Email/Phone: ${_emailController.text}');
      context.push('/verficationforgetpassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AuthHeader(
                title: 'إعادة تعيين كلمة المرور',
                subtitle:
                    'فضلك أدخل البريد الإلكتروني أو رقم الموبايل المرتبط بحسابك للحصول على رمز التحقق.',
              ),
              const SizedBox(height: 16),
              Text(
                'البريد الإلكتروني أو رقم الهاتف',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _emailController,
                hintText: 'أدخل البريد الإلكتروني أو رقم الهاتف',
                icon: Icons.alternate_email,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => Validators.emailOrPhoneValidator(v),
              ),
              const SizedBox(height: 113),

              // ✅ Spacer بدل الـ SizedBox الكبير
              Center(
                child: CustomTextBtn(
                  text: 'إرسال رمز التحقق',
                  onPressed: _sendResetCode,
                ),
              ),

              const SizedBox(height: 180),

              Center(
                child: AuthSwitchRow(
                  leadingText: 'تذكرت كلمة السر؟',
                  actionText: "تسجيل الدخول",
                  onTap: () => context.push('/login'),
                ),
              ),
              //    SizedBox(height: 121,)
            ],
          ),
        ),
      ),
    );
  }
}
