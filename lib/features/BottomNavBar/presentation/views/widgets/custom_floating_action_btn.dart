import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:plupool/core/utils/functions/open_whatsapp.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: SizedBox(
        height: SizeConfig.h(40),
        width:SizeConfig.w(40) ,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          elevation: 1,
          onPressed: () {
            openWhatsApp();
          },
         // mini: true,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(6),vertical:   SizeConfig.h(6)), // ✅ padding حوالين الأيقونة
            child: SvgPicture.asset(
              'assets/icons/whatsapp_icon.svg',
              width:SizeConfig.w(28) , // 👈 صغريها شوية
              height:SizeConfig.w(28),
            ),
          ),
        ),
      ),
    );
  }
}
