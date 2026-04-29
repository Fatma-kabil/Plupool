import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/domain/entities/order_status.dart';
import 'package:plupool/features/orders/domain/entities/order_status_extension.dart';

class OrdrStatusRow extends StatelessWidget {
  const OrdrStatusRow({
    super.key, required this.status,
   
  });
  final String status;

  @override
  Widget build(BuildContext context) {
     final OrderStatus orderStatus = parseOrderStatus(status);
    return Row(
      children: [
        Icon(orderStatus.icon, color: orderStatus.color, size:SizeConfig.isWideScreen?SizeConfig.h(22): SizeConfig.w(20)),
        SizedBox(width: SizeConfig.w(3)),
        Text(
           orderStatus.arName,
      //    status.text,
          style: AppTextStyles.styleBold14(context).copyWith(color: orderStatus.color),
        ),
      ],
    );
  }
}
