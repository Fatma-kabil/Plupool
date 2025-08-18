import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_phone_field.dart';
import 'package:plupool/features/auth/presentation/views/widgets/password_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,

    required this.phoneController,
    required this.passwordController,

    required this.formKey,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    

    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.isWideScreen ? SizeConfig.w(30) : SizeConfig.w(15),
        ),
        child: Column(
          children: [
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
