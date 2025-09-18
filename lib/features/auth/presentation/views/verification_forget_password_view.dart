import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verfication_forget_password_view_body.dart';

class VerificationForgetPasswordView extends StatelessWidget {
  const VerificationForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: VerficationForgetPasswordViewBody()),
    );
  }
}
