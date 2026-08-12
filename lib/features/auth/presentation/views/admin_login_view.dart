import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/admin_login_view_body.dart';

class AdminLoginView extends StatelessWidget {
  const AdminLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: AdminLoginViewBody()));
  }
}
