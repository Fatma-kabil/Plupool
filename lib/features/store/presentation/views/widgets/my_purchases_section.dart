import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/my_purchases_card.dart';

class MyPurchasesSection extends StatelessWidget {
  const MyPurchasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: SizeConfig.ismidwidthScreen?SizeConfig.h(8):0,),
        Expanded(
          child: ListView.builder(
            //  padding: EdgeInsets.only(top: SizeConfig.h(10)),
            itemCount: 6,
            itemBuilder: (_, i) =>  MyPurchasesCard(),
          ),
        ),

      ],
    );
  }
}