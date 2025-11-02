import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/privacy_policy_view_body.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: PrivacyPolicyViewBody()));
  }
}
