import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_card_header.dart';
import 'package:plupool/features/orders/presentation/view/widgets/product_details_row.dart';
import 'package:plupool/features/orders/presentation/view/widgets/total_fees_sectin.dart';

class OrderDetailsViewBodyMiddleSection extends StatelessWidget {
  const OrderDetailsViewBodyMiddleSection({super.key, required this.model});
  final OrderCardModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(bottom: SizeConfig.h(25)),
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
            padding: EdgeInsets.symmetric(vertical: SizeConfig.h(10)),
            child: Divider(),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ProductDetailsRow();
            },
          ),
          TotalFeesSection(),
        ],
      ),
    );
  }
}
