import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/resset_password_body.dart';

class RessetPassword extends StatelessWidget {
  const RessetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:RessetPasswordBody(),
    );
  }
}