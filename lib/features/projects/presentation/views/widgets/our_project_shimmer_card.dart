import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class OurProjectCardShimmer extends StatelessWidget {
  const OurProjectCardShimmer({super.key});

  Widget _box({double? height, double? width, double radius = 8}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(3)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            /// 🖼 IMAGE SECTION
            SizedBox(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.h(210)
                  : SizeConfig.h(180),
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.white)),
                  Expanded(child: Container(color: Colors.white)),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(16),
                vertical: SizeConfig.h(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// company row
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.h(30),
                        width: SizeConfig.w(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Container(
                        height: SizeConfig.h(14),
                        width: SizeConfig.w(120),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.h(12)),

                  /// title
                  Container(
                    height: SizeConfig.h(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  /// description lines
                  Container(
                    height: SizeConfig.h(12),
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  SizedBox(height: SizeConfig.h(6)),
                  Container(
                    height: SizeConfig.h(12),
                    width: SizeConfig.w(200),
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(12)),

                  const Divider(),

                  SizedBox(height: SizeConfig.h(12)),

                  /// location + duration
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.h(14),
                        width: SizeConfig.w(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(6)),
                      Container(
                        height: SizeConfig.h(12),
                        width: SizeConfig.w(100),
                        color: Colors.white,
                      ),

                      const Spacer(),

                      Container(
                        height: SizeConfig.h(14),
                        width: SizeConfig.w(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(6)),
                      Container(
                        height: SizeConfig.h(12),
                        width: SizeConfig.w(60),
                        color: Colors.white,
                      ),
                    ],
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