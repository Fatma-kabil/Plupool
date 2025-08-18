import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/password_recovery_body.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PasswordRecoveryBody(),
    );
  }
}
