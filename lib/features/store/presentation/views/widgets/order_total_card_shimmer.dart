import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class OrderTotalCardShimmer extends StatelessWidget {
  const OrderTotalCardShimmer({super.key});

  Widget _line({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _line(
              width: SizeConfig.w(130),
              height: SizeConfig.h(18),
            ),

            SizedBox(height: SizeConfig.h(16)),

            Row(
              children: [
                _line(
                  width: SizeConfig.w(80),
                  height: SizeConfig.h(16),
                ),
                const Spacer(),
                _line(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(16),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(14)),

            Row(
              children: [
                _line(
                  width: SizeConfig.w(95),
                  height: SizeConfig.h(16),
                ),
                const Spacer(),
                _line(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(16),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(8)),
            Divider(color: Colors.white),

            SizedBox(height: SizeConfig.h(8)),

            Row(
              children: [
                _line(
                  width: SizeConfig.w(120),
                  height: SizeConfig.h(18),
                ),
                const Spacer(),
                _line(
                  width: SizeConfig.w(80),
                  height: SizeConfig.h(18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}