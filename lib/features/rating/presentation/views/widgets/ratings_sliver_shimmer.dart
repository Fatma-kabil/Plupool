import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/theme/app_colors.dart';

class RatingsSliverShimmer extends StatelessWidget {
  const RatingsSliverShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = SizeConfig.isWideScreen;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 16 : 0,
              vertical: SizeConfig.h(8),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(12),
                  vertical: SizeConfig.h(16),
                ),
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.textFieldBorderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header line
                    Row(
                      children: [
                        _box(width: 120, height: 14),
                        const Spacer(),
                        _circle(24),
                      ],
                    ),

                    SizedBox(height: SizeConfig.h(10)),

                    /// phone
                    _box(width: 90, height: 12),

                    SizedBox(height: SizeConfig.h(10)),

                    /// stars
                    Row(
                      children: List.generate(
                        5,
                        (i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: _circle(16),
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.h(10)),

                    /// comment
                    _box(width: double.infinity, height: 10),
                    SizedBox(height: 6),
                    _box(width: double.infinity, height: 10),
                    SizedBox(height: 6),
                    _box(width: 180, height: 10),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: 6,
      ),
    );
  }

  Widget _box({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}