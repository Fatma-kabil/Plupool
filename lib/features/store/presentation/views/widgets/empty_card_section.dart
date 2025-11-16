import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class EmptyCartSection extends StatelessWidget {
  const EmptyCartSection({super.key, required this.icon, required this.tittle});
  final IconData icon;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: SizeConfig.h(120), color: Color(0xffD4D4D4)),
          SizedBox(height: SizeConfig.h(20)),
          Text(tittle, style: AppTextStyles.styleRegular25(context)),
        ],
      ),
    );
  }
}
