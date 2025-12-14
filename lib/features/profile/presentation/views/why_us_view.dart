import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/why_us_view_body.dart';

class WhyUsView extends StatelessWidget {
  const WhyUsView({super.key, required this.role});
  final String role;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(17),
              vertical: SizeConfig.h(25),
            ),
            child: WhyUsViewBody(role: role,),
          ),
        ),
      ),
    );
  }
}
