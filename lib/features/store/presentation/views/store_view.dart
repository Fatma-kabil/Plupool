import 'package:flutter/material.dart';
import 'package:plupool/features/store/presentation/views/widgets/action_raw.dart';
import 'package:plupool/features/store/presentation/views/widgets/info_card_row.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 16, right: 16),
      child: ListView(
        children: [ActionsRow(cartCount: 0), SizedBox(height: 30),// الصف اللي فيه الثلاث بطاقات
           Center(
            child: InfoCardsRow(
            
            ),
          ),],
      ),
    );
  }
}
