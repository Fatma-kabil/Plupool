import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class MyPurchasesCardShimmer extends StatelessWidget {
  const MyPurchasesCardShimmer({super.key});

  Widget _box({
    required double width,
    required double height,
    double radius = 8,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.textFieldBorderColor,
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _box(
                  width: SizeConfig.w(100),
                  height: SizeConfig.h(16),
                ),
                const Spacer(),
                _box(
                  width: SizeConfig.w(60),
                  height: SizeConfig.h(16),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(12)),

            _box(
              width: SizeConfig.w(140),
              height: SizeConfig.h(14),
            ),

            SizedBox(height: SizeConfig.h(10)),

            Divider(color: Colors.white),

            SizedBox(height: SizeConfig.h(10)),

            Row(
              children: [
                _box(
                  width: SizeConfig.w(69),
                  height: SizeConfig.h(88),
                  radius: 10,
                ),

                SizedBox(width: SizeConfig.w(12)),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _box(
                        width: double.infinity,
                        height: SizeConfig.h(16),
                      ),
                      SizedBox(height: SizeConfig.h(8)),
                      _box(
                        width: SizeConfig.w(120),
                        height: SizeConfig.h(16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(10)),

            Divider(color: Colors.white),

            SizedBox(height: SizeConfig.h(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(
                  width: SizeConfig.w(80),
                  height: SizeConfig.h(16),
                ),
                _box(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}