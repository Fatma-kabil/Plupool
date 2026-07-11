import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
            ? 0.62
            : SizeConfig.screenWidth == 800
            ? .82
            : SizeConfig.screenWidth > 800
            ? 0.91
            : 0.71,
        crossAxisSpacing: SizeConfig.w(12),
        mainAxisSpacing: SizeConfig.w(12),
      ),
      itemBuilder: (context, index) => const ProductCardShimmer(),
    );
  }
}

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  Widget shimmerBox({
    required double height,
    required double width,
    double radius = 8,
  }) {
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(1, 1),
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(10),
          vertical: SizeConfig.h(15),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// image
              shimmerBox(
                height: SizeConfig.isWideScreen
                    ? SizeConfig.w(101)
                    : SizeConfig.h(101),
                width: double.infinity,
                radius: 10,
              ),

              SizedBox(height: SizeConfig.h(12)),

              /// title line 1
              shimmerBox(height: SizeConfig.h(14), width: SizeConfig.w(120)),

              SizedBox(height: SizeConfig.h(8)),

              /// title line 2
              shimmerBox(height: SizeConfig.h(14), width: SizeConfig.w(80)),

              SizedBox(height: SizeConfig.h(14)),

              /// price
              shimmerBox(height: SizeConfig.h(18), width: SizeConfig.w(90)),

              const Spacer(),

              /// button
              shimmerBox(
                height: SizeConfig.h(42),
                width: double.infinity,
                radius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
