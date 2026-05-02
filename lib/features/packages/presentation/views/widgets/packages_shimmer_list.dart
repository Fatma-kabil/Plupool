import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class PackagesShimmerList extends StatelessWidget {
  const PackagesShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (_, __) => const PackageShimmerCard(),
    );
  }
}


class PackageShimmerCard extends StatelessWidget {
  const PackageShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(17),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---- title row ----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// title
                Container(
                  height: SizeConfig.h(14),
                  width: SizeConfig.w(180),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),

                /// status label
                Container(
                  height: SizeConfig.h(20),
                  width: SizeConfig.w(70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(12)),

            /// ---- date line ----
            Container(
              height: SizeConfig.h(10),
              width: SizeConfig.w(140),
              color: Colors.white,
            ),

            SizedBox(height: SizeConfig.h(15)),

            /// ---- progress bar ----
            Container(
              height: SizeConfig.h(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            /// ---- button ----
            Container(
              height: SizeConfig.h(35),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}