import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(child: ForgetPasswordScreenBody()),
    );
  }
}
