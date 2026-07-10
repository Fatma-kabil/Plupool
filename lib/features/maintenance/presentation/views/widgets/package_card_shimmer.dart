import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class PackageCardShimmer extends StatelessWidget {
  const PackageCardShimmer({super.key});

  Widget _box({
    required double height,
    double? width,
    BorderRadius? radius,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kScaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xff80BBDA),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(16),
          vertical: SizeConfig.h(18),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box(
                  height: SizeConfig.h(24),
                  width: SizeConfig.w(180),
                ),

                SizedBox(height: SizeConfig.h(20)),

                ...List.generate(
                  5,
                  (_) => Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeConfig.h(14),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: SizeConfig.w(18),
                          height: SizeConfig.w(18),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),

                        SizedBox(width: SizeConfig.w(10)),

                        Expanded(
                          child: _box(
                            height: SizeConfig.h(14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: SizeConfig.h(18)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: _box(
                    height: SizeConfig.h(22),
                    width: SizeConfig.w(100),
                  ),
                ),

                SizedBox(height: SizeConfig.h(24)),

                _box(
                  height: SizeConfig.h(48),
                  width: double.infinity,
                  radius: BorderRadius.circular(12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}