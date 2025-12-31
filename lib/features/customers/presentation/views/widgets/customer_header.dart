import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_avatar.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_info.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_status.dart';

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
        CustomerStatus(isActive: isActive),
      ],
    );
  }
}
