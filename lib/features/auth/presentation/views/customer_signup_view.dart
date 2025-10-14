import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/customer_signup_view_body.dart';

class CustomerSignupView extends StatelessWidget {
  const CustomerSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomerSignupViewBody(),
      ),
    );
  }
}