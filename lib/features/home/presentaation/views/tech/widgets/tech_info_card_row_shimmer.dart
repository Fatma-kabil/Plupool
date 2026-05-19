import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class TechInfoCardRowShimmer extends StatelessWidget {
  const TechInfoCardRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
    children: [
      Expanded(child: _buildShimmerCard(context)),
      SizedBox(width: SizeConfig.w(6)),
      Expanded(child: _buildShimmerCard(context)),
      SizedBox(width: SizeConfig.w(6)),
      Expanded(child: _buildShimmerCard(context)),
    ],
  );
  }
}
Widget _buildShimmerCard(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: SizeConfig.w(12),
      vertical: SizeConfig.h(14),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(SizeConfig.w(16)),
    ),

    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: AspectRatio(
        aspectRatio: 0.95,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// icon
            Container(
              width: SizeConfig.w(28),
              height: SizeConfig.w(28),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),

            const Spacer(),

            /// value
            Container(
              width: SizeConfig.w(40),
              height: SizeConfig.h(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.w(4),
                ),
              ),
            ),

            SizedBox(height: SizeConfig.h(10)),

            /// label
            Container(
              width: SizeConfig.w(70),
              height: SizeConfig.h(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.w(4),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}