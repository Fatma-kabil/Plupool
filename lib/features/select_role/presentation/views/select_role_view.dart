import 'package:flutter/material.dart';
import 'package:plupool/features/select_role/presentation/views/widgets/select_role_view_body.dart';

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SelectRoleViewBody()));
  }
}
