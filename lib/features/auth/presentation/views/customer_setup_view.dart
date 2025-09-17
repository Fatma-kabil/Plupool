import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/customer_setup_view_body.dart';

class CustomerSetupView extends StatelessWidget {
  const CustomerSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomerSetupViewBody(),
      ),
    );
  }
}