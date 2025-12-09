import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_notification_view_body.dart';

class CusmoterNotificationView extends StatelessWidget {
  const CusmoterNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child:Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(13),
            vertical: SizeConfig.h(15),
            
          ),
          child:CustomerNotificationViewBody(),
        ),
      ),
    )
    );
  }
}
