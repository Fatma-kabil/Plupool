import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/tech_setup_view_body.dart';

class TechSetupView extends StatelessWidget {
  const TechSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TechSetupViewBody()),
    );
  }
}
