import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/note_and_time_section.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_card_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_datails.dart';

class CustomerOrderCard extends StatelessWidget {
  const CustomerOrderCard({super.key, required this.order, this.onTap});
final Map<String, dynamic> order;
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
          CustomerOrderCardHeader(
           orderNumber: order["order_number"],
            status: order["status"],
            createdAt: DateTime.parse(order["created_at"]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(7),
              horizontal: SizeConfig.w(8),
            ),
            child: Divider(color: AppColors.textFieldBorderColor, thickness: 1),
          ),
          OrderDatails(
            onTap: onTap,
            itemsCount: order["items_count"],
            totalAmount: order["total_amount"],
            deliveryFee: order["delivery_fee"],
            grandTotal: order["grand_total"],
          ),
          SizedBox(height: SizeConfig.h(12)),
          if (order["admin_notes"] != null) NoteAndTimeSection(text: order["admin_notes"]!, date: DateTime.parse(order["admin_notes_updated_at"]!) ),
        ],
      ),
    );
  }
}
