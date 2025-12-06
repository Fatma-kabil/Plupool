import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_view_body.dart';

class MyPoolView extends StatelessWidget {
  const MyPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: MyPoolViewBody(),
        ),
      ),
    );
  }
}
