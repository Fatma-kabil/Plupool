import 'package:flutter/material.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_body_middle_section.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_footer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/status_and_note_section.dart';

class CustomerOrderDetailsViewBody extends StatelessWidget {
  const CustomerOrderDetailsViewBody({super.key, required this.model});
 final OrderCardModel model;
  @override
  Widget build(BuildContext context) {
 return   SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
         OrderDetailsViewBodyMiddleSection(model:model),
          SizedBox(height: 25),
         
           StatusAndNoteSection(statu: model.satus),
            SizedBox(height: 25),
           OrderDetailsViewFooter(),
         
        ],
      ),
    );
  }
}
