import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/orders/data/models/order_card_model.dart';
import 'package:plupool/features/orders/presentation/view/widgets/customer_order_details_view_body.dart';

class CustomerOrderDetailsView extends StatefulWidget {
  const CustomerOrderDetailsView({super.key, required this.model});
  final OrderCardModel model;

  @override
  State<CustomerOrderDetailsView> createState() => _CustomerOrderDetailsViewState();
}

class _CustomerOrderDetailsViewState extends State<CustomerOrderDetailsView> {
final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: CustomAppBar(
            isSearch: false,
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),
            child: CustomerOrderDetailsViewBody(model: widget.model,)
          )
        ),
      ),
    );
  }
}