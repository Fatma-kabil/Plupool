import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class OwnerOfferSectionShimmer extends StatelessWidget {
  const OwnerOfferSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child:     SizedBox(
      height: SizeConfig.h(360),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const OwnerOfferCardShimmer();
        },
      ),
    ),
    );
    

  }
}

class OwnerOfferCardShimmer extends StatelessWidget {
  const OwnerOfferCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(246), // 👈 مهم زي ما اتفقنا
      margin: EdgeInsets.only(left: SizeConfig.w(15)),
      padding: EdgeInsets.all(SizeConfig.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Container(
              height: SizeConfig.h(173),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            /// TITLE
            Container(
              height: SizeConfig.h(12),
              width: SizeConfig.w(140),
              color: Colors.grey,
            ),

            SizedBox(height: SizeConfig.h(10)),

            /// ROW INFO
            Row(
              children: [
                Container(
                  height: SizeConfig.h(10),
                  width: SizeConfig.w(100),
                  color: Colors.grey,
                ),
                SizedBox(width: SizeConfig.w(6)),
                Container(
                  height: SizeConfig.h(10),
                  width: SizeConfig.w(80),
                  color: Colors.grey,
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(10)),

            /// DESCRIPTION LINE 2
            Container(
              height: SizeConfig.h(10),
              width: SizeConfig.w(180),
              color: Colors.grey,
            ),

            const Spacer(),

            /// BUTTON
            Container(
              height: SizeConfig.h(42),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
