import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/note_and_time_section.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_card_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_datails.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.model, this.onTap});
  final OrderCardModel model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(25)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          OrderCardHeader(model: model),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(7),
              horizontal: SizeConfig.w(8),
            ),
            child: Divider(color: AppColors.textFieldBorderColor, thickness: 1),
          ),
          OrderDatails(onTap:onTap ,),
          SizedBox(height: SizeConfig.h(12)),
          if (model.note != null) NoteAndTimeSection(text: model.note!),
        ],
      ),
    );
  }
}
