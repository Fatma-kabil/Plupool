import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/content_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/pool_info_row.dart';

class MyPoolViewBody extends StatelessWidget {
  const MyPoolViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/pool_background.png',
            //  height: SizeConfig.h(260), // ← حددي الارتفاع اللي انتي عايزاه
            fit: BoxFit.contain,
          ),
        ),

        Positioned(
          top: SizeConfig.h(170),
          left:SizeConfig.w(15) ,
          right: SizeConfig.w(15),
          child: PoolInfoRow(),
        ),
          Positioned(
          top: SizeConfig.h(290),
          left:0 ,
          right: 0,
          bottom: 0,
          child: ContentCard(),
        ),
      ],
    );
  }
}
