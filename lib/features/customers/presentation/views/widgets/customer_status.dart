import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerStatus extends StatelessWidget {
  const CustomerStatus({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xff05B285) : const Color(0xffE63946);
    return Row(
      children: [
        Icon(Icons.circle, size: SizeConfig.w(8), color: color),
        SizedBox(width: SizeConfig.w(4)),
        Text(
          isActive ? "نشط" : "غير نشط",
          style: AppTextStyles.styleSemiBold16(context).copyWith(color: color),
        ),
      ],
    );
  }
}
