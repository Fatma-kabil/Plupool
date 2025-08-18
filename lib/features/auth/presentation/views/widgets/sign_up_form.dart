import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_phone_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/password_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.nameController,
    required this.formKey,
  });
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
   

    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.isWideScreen ? SizeConfig.w(30) : SizeConfig.w(15),
        ),
        child: Column(
          children: [
            CustomTextField(
              controller: widget.nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'من فضلك ادخل اسمك بالكامل';
                }

                return null;
              },
            ),
            SizedBox(height: 20),
            CustomPhoneField(
              controller: widget.phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'من فضلك ادخل رقم الهاتف';
                }

                return null;
              },
            ),
            SizedBox(height: 20),
            PasswordField(
              controller: widget.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'من فضلك ادخل كلمة المرور';
                }
                if (value.length < 6) {
                  return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
