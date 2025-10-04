import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 6),
          // 📧 البريد أو الهاتف
          Text(
            'البريد الإلكتروني أو رقم الهاتف',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            controller: _emailController,
            hintText: 'أدخل البريد الإلكتروني أو رقم الهاتف',
            icon: Icons.alternate_email, // أيقونة أنسب
            keyboardType: TextInputType.emailAddress,
            validator: (v) => Validators.email(v),
          ),
          const SizedBox(height: 6),

          // 🔑 كلمة المرور
          Text(
            'كلمة المرور',
            style: AppTextStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff333333)),
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'أدخل كلمة المرور',
            icon: Icons.lock_outline, // أيقونة أوضح لكلمة المرور
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (v) => Validators.password(v),
            // TODO: ضيفي أيقونة عرض/إخفاء كلمة المرور في sufficon لو حابة
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
