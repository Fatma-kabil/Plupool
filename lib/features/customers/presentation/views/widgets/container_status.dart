import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_status.dart';

class ContainerStatus extends StatelessWidget {
  const ContainerStatus({super.key, required this.isActive});
 final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(4),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isActive?Color(0xffCDF7EC):Color(0xffFAD7DA),
        
      ),
      child: CustomerStatus(isActive: isActive),
    );
  }
}
