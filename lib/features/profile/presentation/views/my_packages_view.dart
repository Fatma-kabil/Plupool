import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/my_packages_view_body.dart';

class MyPackagesView extends StatelessWidget {
  const MyPackagesView({super.key});

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
            child: MyPackagesViewBody(),
          ),
        ),
      ),
    );
  }
}
  