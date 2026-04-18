import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class OfferShimmerCard extends StatelessWidget {
  const OfferShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            // 📦 Image placeholder (responsive)
            Container(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.h(120)
                  : SizeConfig.h(140),
              width: SizeConfig.isWideScreen
                  ? SizeConfig.w(110)
                  : SizeConfig.w(100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            SizedBox(width: SizeConfig.w(12)),

            // 📝 Text area
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Container(
                    height: SizeConfig.h(14),
                    width: double.infinity,
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  // Date row
                  Container(
                    height: SizeConfig.h(12),
                    width: SizeConfig.w(120),
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  // Description line 1
                  Container(
                    height: SizeConfig.h(12),
                    width: double.infinity,
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(6)),

                  // Description line 2
                  Container(
                    height: SizeConfig.h(12),
                    width: SizeConfig.w(180),
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  // Footer button placeholder
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: SizeConfig.h(30),
                      width: SizeConfig.w(90),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}