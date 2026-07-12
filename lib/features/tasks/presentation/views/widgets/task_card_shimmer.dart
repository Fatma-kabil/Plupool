import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class TaskCardShimmer extends StatelessWidget {
  const TaskCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(10)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _box(
                        width: SizeConfig.w(120),
                        height: SizeConfig.h(16),
                      ),
                      SizedBox(height: SizeConfig.h(8)),
                      _box(
                        width: SizeConfig.w(170),
                        height: SizeConfig.h(12),
                      ),
                    ],
                  ),
                ),
                _box(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(28),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(16)),

            Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.w(16),
                  backgroundColor: Colors.white,
                ),

                SizedBox(width: SizeConfig.w(8)),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _box(
                        width: SizeConfig.w(100),
                        height: SizeConfig.h(14),
                      ),
                      SizedBox(height: SizeConfig.h(6)),
                      _box(
                        width: SizeConfig.w(140),
                        height: SizeConfig.h(12),
                      ),
                    ],
                  ),
                ),

                _box(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(32),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _box({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}