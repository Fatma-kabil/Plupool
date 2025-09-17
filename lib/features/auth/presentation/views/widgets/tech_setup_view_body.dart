import 'package:flutter/material.dart';
import 'package:plupool/features/auth/presentation/views/widgets/custom_back_button.dart';

class TechSetupViewBody extends StatelessWidget {
  const TechSetupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24), // مسافة يمين وشمال
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
        
            // ✅ زر الرجوع
            const CustomBackButton(),
        
            const SizedBox(height: 100),])));
  }
}