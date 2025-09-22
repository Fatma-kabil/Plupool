import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/validators.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:plupool/core/utils/widgets/custom_text_btn.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _saveNewPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      // هنا تقدر تضيف اللوجيك لحفظ كلمة المرور
      debugPrint("Password: ${_passwordController.text}");
      context.push('/newpaswordsuccess');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AuthHeader(
                title: 'كلمة مرور جديدة',
                subtitle: 'من فضلك أدخل كلمة مرور جديدة لحسابك',
              ),
              const SizedBox(height: 16),

              // كلمة المرور
              Text(
                'كلمة المرور',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                controller: _passwordController,
                hintText: 'أدخل كلمة المرور',
                icon: Icons.lock_outline,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (v) => Validators.password(v),
              ),
              const SizedBox(height: 7),
              Text(
                'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل*',
                style: AppTextStyles.styleRegular13(context).copyWith(color: AppColors.kprimarycolor),
              ),
              const SizedBox(height: 24),

              // تأكيد كلمة المرور
              Text(
                'تأكيد كلمة المرور الجديدة',
                style: AppTextStyles.styleSemiBold16(
                  context,
                ).copyWith(color: const Color(0xff333333)),
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                controller: _confirmPasswordController,
                hintText: 'أدخل كلمة المرور مرة أخرى',
                icon: Icons.lock_outline,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'من فضلك أدخل تأكيد كلمة المرور';
                  }
                  if (v != _passwordController.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 109),

              Center(
                child: CustomTextBtn(text: 'حفظ', onPressed: _saveNewPassword),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
