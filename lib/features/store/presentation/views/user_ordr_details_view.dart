import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/domain/entities/store_rder_entity.dart';
import 'package:plupool/features/store/presentation/views/widgets/user_order_datails_view_body.dart';

class UserOrdrDetailsView extends StatelessWidget {
  const UserOrdrDetailsView({super.key, required this.order});
  final StoreOrderEntity order;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.h(20),
            left: SizeConfig.w(15),
            right: SizeConfig.w(15),
          ),
          child: UserOrderDatailsViewBody(
            order: order,
          ),
        ),
      )  );
  }
}