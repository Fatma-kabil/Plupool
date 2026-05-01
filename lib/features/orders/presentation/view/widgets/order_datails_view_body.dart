import 'package:flutter/material.dart';
import 'package:plupool/features/orders/domain/entities/order_entity.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_body_middle_section.dart';
import 'package:plupool/features/orders/presentation/view/widgets/order_details_view_footer.dart';
import 'package:plupool/features/orders/presentation/view/widgets/status_and_note_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';

class OrderDatailsViewBody extends StatelessWidget {
  const OrderDatailsViewBody({super.key, required this.model});
  final OrderEntity model;
  @override
  Widget build(BuildContext context) {
 return   SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageDatailsViewHeader(
            name: model.userName,
            phone: model.userPhone,
            status: model.userIsActive,
            imageUrl: model.userImage,
            location: model.deliveryAddress,
          ),
          SizedBox(height: 25),
         OrderDetailsViewBodyMiddleSection(model:model),
          SizedBox(height: 25),
         
          StatusAndNoteSection(statu: model.status),
            SizedBox(height: 25),
           OrderDetailsViewFooter(),
         
        ],
      ),
    );
  }
}
