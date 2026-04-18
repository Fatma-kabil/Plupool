import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProductsShimmerList extends StatelessWidget {
  const ProductsShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const _ShimmerCard(),
        childCount: 6,
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(8),
      ),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFFFFFFFF),
        period: const Duration(milliseconds: 900),
        child: Container(
          padding: EdgeInsets.all(SizeConfig.w(12)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              /// 📦 IMAGE (responsive)
              Container(
                width: SizeConfig.isWideScreen
                    ? SizeConfig.w(110)
                    : SizeConfig.w(90),
                height: SizeConfig.isWideScreen
                    ? SizeConfig.h(110)
                    : SizeConfig.h(90),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              SizedBox(width: SizeConfig.w(12)),

              /// 📝 TEXT AREA
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Container(
                      height: SizeConfig.h(14),
                      width: double.infinity,
                      color: Colors.white,
                    ),

                    SizedBox(height: SizeConfig.h(10)),

                    // subtitle
                    Container(
                      height: SizeConfig.h(12),
                      width: SizeConfig.w(180),
                      color: Colors.white,
                    ),

                    SizedBox(height: SizeConfig.h(10)),

                    // price / info
                    Container(
                      height: SizeConfig.h(12),
                      width: SizeConfig.w(120),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}