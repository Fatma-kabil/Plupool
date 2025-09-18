import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'يلا نسجل دخولك',
              subtitle: 'أدخل بياناتك للوصول لحسابك',
            ),
          ],
        ),
      ),
    );
  }
}
