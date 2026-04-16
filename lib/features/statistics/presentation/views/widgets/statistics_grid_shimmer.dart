import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';
class StatisticsGridShimmer extends StatelessWidget {
  const StatisticsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 الجزء الأول (Statistics)
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio:
                SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
                    ? 0.90
                    : SizeConfig.screenWidth == 800
                        ? 1.05
                        : SizeConfig.screenWidth > 1000
                            ? 1.20
                            : SizeConfig.screenWidth > 800
                                ? 1.1
                                : 0.94,
            crossAxisSpacing: SizeConfig.w(6),
            mainAxisSpacing: SizeConfig.h(15),
          ),
          itemBuilder: (_, i) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.h(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),

        SizedBox(height: SizeConfig.h(40)),

        /// 🔹 العنوان
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: SizeConfig.w(150),
            height: SizeConfig.h(16),
            color: Colors.grey.shade300,
          ),
        ),

        SizedBox(height: SizeConfig.h(15)),

        /// 🔹 Dashboard Grid Shimmer
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4, // نفس عدد الكروت تقريبًا
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SizeConfig.w(4),
            mainAxisSpacing: SizeConfig.h(15),
            childAspectRatio:
                SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
                    ? 2.3
                    : SizeConfig.screenWidth == 800
                        ? 2.5
                        : SizeConfig.screenWidth > 800
                            ? 3
                            : 2.5,
          ),
          itemBuilder: (_, i) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(12),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}