import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: VerificationViewBody()));
  }
}