import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';

import 'package:plupool/features/services/presentation/views/widgets/pool_card.dart';

class PoolsList extends StatelessWidget {
  const PoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pools.map(
        (pool) => Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: PoolCard(pool: pool),
        ),
      ).toList(),
    );
  }
}
