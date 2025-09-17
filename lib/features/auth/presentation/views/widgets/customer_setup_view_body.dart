import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/auth_header.dart';

class CustomerSetupViewBody extends StatelessWidget {
  const CustomerSetupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'أنشئ ملفك الشخصي الآن',
              subtitle: 'أدخل بياناتك حتي تستفيد بكل الخدمات',
            ),
          ],
        ),
      ),
    );
  }
}
