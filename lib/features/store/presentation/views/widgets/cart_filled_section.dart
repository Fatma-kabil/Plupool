import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/store/presentation/views/widgets/cart_item_card.dart';
import 'package:plupool/features/store/presentation/views/widgets/verified_btn.dart';

class CartFilledSection extends StatelessWidget {
  const CartFilledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.ismidwidthScreen?SizeConfig.h(8):0,),
        Expanded(
          child: ListView.builder(
            //  padding: EdgeInsets.only(top: SizeConfig.h(10)),
            itemCount: 6,
            itemBuilder: (_, i) => const CartItemCard(),
          ),
        ),

        // زر تأكيد الطلب
        Padding(
          padding: EdgeInsets.symmetric(
            //   horizontal: SizeConfig.w(10),
            vertical: SizeConfig.h(10),
          ),
          child: VerifiedBtn(onPressed: () {
            
          },)
        ),
      ],
    );
  }
}
