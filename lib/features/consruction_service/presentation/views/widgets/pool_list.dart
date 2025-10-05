import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';

import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_card.dart';

class PoolsList extends StatelessWidget {
  const PoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pools
          .map(
            (pool) => Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: PoolCard(
                pool: pool,
                onPressed: () {
                  context.push(
                    '/reserveconstructionview',
                    extra: pool, // 👈 هنبعت الـ PoolModel كله);
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
