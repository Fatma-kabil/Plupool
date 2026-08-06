import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class ServiceCardShimmer extends StatelessWidget {
  const ServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.w(14)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
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
                Container(
                  width: SizeConfig.w(75),
                  height: SizeConfig.h(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: SizeConfig.w(120),
                      height: SizeConfig.h(16),
                      color: Colors.white,
                    ),
                    SizedBox(height: SizeConfig.h(8)),
                    Container(
                      width: SizeConfig.w(90),
                      height: SizeConfig.h(12),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(18)),

            Container(
              width: double.infinity,
              height: SizeConfig.h(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            Container(
              width: SizeConfig.w(140),
              height: SizeConfig.h(12),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}