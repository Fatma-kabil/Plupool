import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_notefications_body.dart';

class TechNotifications extends StatelessWidget {
  const TechNotifications({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(13),
            vertical: SizeConfig.h(15),
            
          ),
          child:NotificationsViewBody(),
        ),
      ),
    );
  }
}
