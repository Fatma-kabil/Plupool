import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';

class CustomerHeader extends StatelessWidget {
  const CustomerHeader({super.key});

  final bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomerAvatar(),
        SizedBox(width: SizeConfig.w(7)),
        const CustomerInfo(),
        const Spacer(),
        _CustomerStatus(context),
      ],
    );
  }

  Widget _CustomerStatus(BuildContext context) {
    final color = isActive ? const Color(0xff05B285) : const Color(0xffE63946);
    return Row(
      children: [
        Icon(Icons.circle, size: SizeConfig.w(10), color: color),
        SizedBox(width: SizeConfig.w(4)),
        Text(
          isActive ? "نشط" : "غير نشط",
          style:
              AppTextStyles.styleSemiBold16(context).copyWith(color: color),
        ),
      ],
    );
  }
}
