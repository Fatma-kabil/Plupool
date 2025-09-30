import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:plupool/core/utils/functions/open_whatsapp.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        elevation: 1,
        onPressed: () {
          openWhatsApp();
        },
        mini: true,
        child: Padding(
          padding: const EdgeInsets.all(6), // ✅ padding حوالين الأيقونة
          child: SvgPicture.asset(
            'assets/icons/whatsapp_icon.svg',
            width: 28, // 👈 صغريها شوية
            height: 28,
          ),
        ),
      ),
    );
  }
}
