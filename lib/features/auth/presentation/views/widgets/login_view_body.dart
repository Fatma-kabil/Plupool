import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomAppBar(title: "تسجيل الدخول")]);
  }
}
