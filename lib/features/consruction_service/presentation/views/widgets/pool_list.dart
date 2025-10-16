import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';

import 'package:plupool/features/consruction_service/presentation/views/widgets/pool_card.dart';

class PoolsList extends StatelessWidget {
  const PoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pools
          .map(
            (pool) => Padding(
              padding:  EdgeInsets.only(bottom:SizeConfig.w(22) ),
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
