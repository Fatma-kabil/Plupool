import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class MyProjectCardShimmer extends StatelessWidget {
  const MyProjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget box({
      required double width,
      required double height,
      double radius = 6,
    }) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
    }

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.w(14)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizeConfig.w(10)),
          border: Border.all(color: const Color(0xffE5E5E5)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                box(
                  width: SizeConfig.w(170),
                  height: SizeConfig.h(18),
                ),
                const Spacer(),
                box(
                  width: SizeConfig.w(75),
                  height: SizeConfig.h(28),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(12)),

            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    color: Colors.white),
                SizedBox(width: SizeConfig.w(6)),
                box(
                  width: SizeConfig.w(150),
                  height: SizeConfig.h(14),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(10)),

            Row(
              children: [
                const Icon(Icons.pool, color: Colors.white),
                SizedBox(width: SizeConfig.w(6)),
                box(
                  width: SizeConfig.w(120),
                  height: SizeConfig.h(14),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(18)),

            Row(
              children: [
                box(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(16),
                ),
                SizedBox(width: SizeConfig.w(10)),
                Expanded(
                  child: box(
                    width: double.infinity,
                    height: SizeConfig.h(8),
                    radius: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}