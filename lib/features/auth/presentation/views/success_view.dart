import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/success_view_body.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SuccessViewBody() ,
      ),
    );
  }
}