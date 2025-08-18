import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/auth/presentation/views/widgets/password_field.dart';

class RessetPasswordForm extends StatefulWidget {
  final TextEditingController newPasswordController;
  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey;

  const RessetPasswordForm({
    super.key,

    required this.newPasswordController,
    required this.passwordController,

    required this.formKey,
  });

  @override
  State<RessetPasswordForm> createState() => _RessetPasswordFormState();
}

class _RessetPasswordFormState extends State<RessetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isWide = SizeConfig.screenWidth > 800;

    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? SizeConfig.w(30) : SizeConfig.w(15),
        ),
        child: Column(
          children: [
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
            SizedBox(height: 20),
            PasswordField(
              hintText: 'تأكيد كلمه المرور',
              controller: widget.newPasswordController,
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
