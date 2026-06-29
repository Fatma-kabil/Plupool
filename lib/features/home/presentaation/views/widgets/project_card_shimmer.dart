import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProjectCardShimmer extends StatelessWidget {
  const ProjectCardShimmer({super.key});

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
            /// الصور
            Container(
              height: SizeConfig.isWideScreen
                  ? SizeConfig.h(210)
                  : SizeConfig.h(180),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
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
                  /// اللوجو + الشركة
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.w(30),
                        height: SizeConfig.h(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Container(
                        width: SizeConfig.w(90),
                        height: SizeConfig.h(14),
                        color: Colors.white,
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.h(14)),

                  Container(
                    width: double.infinity,
                    height: SizeConfig.h(18),
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  Container(
                    width: double.infinity,
                    height: SizeConfig.h(14),
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(6)),

                  Container(
                    width: SizeConfig.w(180),
                    height: SizeConfig.h(14),
                    color: Colors.white,
                  ),

                  SizedBox(height: SizeConfig.h(12)),

                  const Divider(),

                  SizedBox(height: SizeConfig.h(12)),

                  Row(
                    children: [
                      Container(
                        width: SizeConfig.w(90),
                        height: SizeConfig.h(14),
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Container(
                        width: SizeConfig.w(70),
                        height: SizeConfig.h(14),
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