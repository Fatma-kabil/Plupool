import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_confirmation_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/order_summary_view_body.dart';
import 'package:plupool/features/store/presentation/views/widgets/verified_btn.dart';
class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({super.key});

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
          child: OrderSummaryViewBody(),
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(12),
        ),
        color: AppColors.kScaffoldColor,
        child: SizedBox(
          height: SizeConfig.h(50),
          child:VerifiedBtn(
  onPressed: () {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const OrderConfirmationCard(),
    );
  },
),

        ),
      ),
    );
  }
}
