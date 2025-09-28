import 'package:flutter/material.dart';
import 'package:plupool/features/store/presentation/views/widgets/action_raw.dart';
class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 15, left: 16, right: 16),
      child: ListView(
        children: [
          ActionsRow(cartCount: 0), // ✅ الرو بقى ويدجت مستقلة
        ],
      ),
    );
  }
}
