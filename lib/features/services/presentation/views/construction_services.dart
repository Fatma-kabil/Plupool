import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/features/services/presentation/views/widgets/service_banner.dart';

class ConstructionServices extends StatelessWidget {
  final VoidCallback onBack; // 👈 دالة هنستدعيها لما نرجع
  const ConstructionServices({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft, // لو عايزة الباك باتون يطلع يمين
            child: CustomBackButton(onTap: onBack),
          ),
          SizedBox(height: 15),
          ServiceBanner(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
