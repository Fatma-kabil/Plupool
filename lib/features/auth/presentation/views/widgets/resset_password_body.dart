import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_app_bar.dart';

class RessetPasswordBody extends StatelessWidget {
  const RessetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [CustomAppBar(title: 'كلمة مرور جديدة')],),
    );
  }
}
