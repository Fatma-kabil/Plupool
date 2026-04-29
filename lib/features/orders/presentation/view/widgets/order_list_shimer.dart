import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class OrderListShimer extends StatelessWidget {
  const OrderListShimer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const OrderCardShimmer(),
        childCount: 6, // عدد skeleton cards
      ),
    );
  }
}

class OrderCardShimmer extends StatelessWidget {
  const OrderCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(25)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(12),
      ),
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
            /// ======================
            /// 🔵 Header (like FAQ title)
            /// ======================
            Container(
              height: SizeConfig.h(14),
              width: SizeConfig.w(180),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            /// ======================
            /// 🔵 Status line
            /// ======================
            Container(
              height: SizeConfig.h(12),
              width: SizeConfig.w(120),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            Divider(color: AppColors.textFieldBorderColor),

            SizedBox(height: SizeConfig.h(12)),

            /// ======================
            /// 🔵 Details (FAQ style lines)
            /// ======================
            Container(
              height: SizeConfig.h(10),
              width: double.infinity,
              color: Colors.white,
            ),

            SizedBox(height: SizeConfig.h(6)),

            Container(
              height: SizeConfig.h(10),
              width: SizeConfig.w(240),
              color: Colors.white,
            ),

            SizedBox(height: SizeConfig.h(6)),

            Container(
              height: SizeConfig.h(10),
              width: SizeConfig.w(180),
              color: Colors.white,
            ),

            SizedBox(height: SizeConfig.h(12)),

            Divider(color: AppColors.textFieldBorderColor),

            SizedBox(height: SizeConfig.h(10)),

            /// ======================
            /// 🔵 Footer (like buttons / note)
            /// ======================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(SizeConfig.w(120), SizeConfig.h(30)),
                _box(SizeConfig.w(90), SizeConfig.h(30)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(double w, double h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}