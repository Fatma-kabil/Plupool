import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class FaqShimmerCard extends StatelessWidget {
  const FaqShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(8),
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔵 question
            Container(
              height: SizeConfig.h(14),
              width: SizeConfig.w(200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            /// 🔵 answer lines
            Container(
              height: SizeConfig.h(10),
              width: double.infinity,
              color: Colors.white,
            ),
            SizedBox(height: SizeConfig.h(6)),
            Container(
              height: SizeConfig.h(10),
              width: SizeConfig.w(250),
              color: Colors.white,
            ),

            SizedBox(height: SizeConfig.h(12)),

            Divider(),

            SizedBox(height: SizeConfig.h(8)),

            /// 🔵 buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _btn(),
                _btn(),
                CircleAvatar(
                  radius: SizeConfig.w(14),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn() {
    return Container(
      height: SizeConfig.h(30),
      width: SizeConfig.w(110),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}