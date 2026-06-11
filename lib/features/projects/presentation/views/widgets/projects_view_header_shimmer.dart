import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ProjectsViewHeaderShimmer extends StatelessWidget {
  const ProjectsViewHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildCard()),
        SizedBox(width: SizeConfig.w(5)),
        Expanded(child: _buildCard()),
        SizedBox(width: SizeConfig.w(5)),
        Expanded(child: _buildCard()),
      ],
    );
  }

  Widget _buildCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: SizeConfig.w(24),
                height: SizeConfig.w(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Container(
              width: SizeConfig.w(35),
              height: SizeConfig.h(18),
              color: Colors.white,
            ),

            Container(
              width: double.infinity,
              height: SizeConfig.h(12),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}