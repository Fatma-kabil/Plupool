import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';

import 'package:plupool/features/auth/presentation/views/widgets/login_form.dart';


class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch, // ياخد العرض كله
        children: [
          CustomAppBar(title: "تسجيل الدخول"),
          SizedBox(height: 20),
          LoginForm(
            phoneController: phoneController,
            passwordController: passwordController,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
