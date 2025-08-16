import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/auth/presentation/views/widgets/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: LoginViewBody()
    );
  }
}
