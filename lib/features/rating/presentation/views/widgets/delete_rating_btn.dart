import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/presentation/view/widgets/delete_order_card.dart';

class DeleteRatingBtn extends StatelessWidget {
  const DeleteRatingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) =>
              const DeleteOrderCard(text: "هل أنت متأكد من حذف هذا التعليق؟"),
        ),
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.w(6)),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFAD7DA),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: Color(0xffE63946),
          size: SizeConfig.isWideScreen ? SizeConfig.w(18) : SizeConfig.w(22),
        ),
      ),
    );
  }
}
