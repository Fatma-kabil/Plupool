import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.h});
  final double? h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1.2), // عرض الخط
      height: SizeConfig.h( h?? 35), // الطول بالنسبة للعناصر
      //  margin:  EdgeInsets.symmetric(horizontal: SizeConfig.w(5)),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(1, 2),
          ),
        ],
      ),
    );
  }
}
