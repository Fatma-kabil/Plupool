import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ReviewsShimmer extends StatelessWidget {
  const ReviewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ReviewCardShimmer();
      },
    );
  }
}

class ReviewCardShimmer extends StatelessWidget {
  const ReviewCardShimmer({super.key});

  Widget _box({double? width, double? height, double radius = 8}) {
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
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.w(20),
        horizontal: SizeConfig.w(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Avatar
            _box(
              width: SizeConfig.w(38),
              height: SizeConfig.w(38),
              radius: 100,
            ),

            SizedBox(width: SizeConfig.w(7)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name + Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _box(width: 120, height: 12),
                      _box(width: 60, height: 10),
                    ],
                  ),

                  SizedBox(height: SizeConfig.h(6)),

                  /// Stars
                  Row(
                    children: List.generate(
                      5,
                      (_) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: _box(width: 16, height: 16),
                      ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  /// Comment lines
                  _box(width: double.infinity),
                  SizedBox(height: 6),
                  _box(width: MediaQuery.of(context).size.width * 0.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
