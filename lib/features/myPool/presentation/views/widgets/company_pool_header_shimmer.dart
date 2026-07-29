import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class CompanyPoolHeaderShimmer extends StatelessWidget {
  const CompanyPoolHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SizeConfig.h(
            SizeConfig.screenHeight >= SizeConfig.screenWidth * 2
                ? 375
                : 425,
          ),
          width: double.infinity,
          child: Image.asset(
            "assets/images/pool_background.png",
            fit: BoxFit.cover,
          ),
        ),

        /// الكارد بتاع بيانات البول
        Positioned(
          top: SizeConfig.h(170),
          left: SizeConfig.w(15),
          right: SizeConfig.w(15),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: SizeConfig.h(110),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),

        /// الكونتينر الأبيض
        Positioned(
          top: SizeConfig.h(
            SizeConfig.screenHeight >= SizeConfig.screenWidth * 2
                ? 290
                : 320,
          ),
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              right: SizeConfig.w(18),
              left: SizeConfig.w(18),
              top: SizeConfig.h(20),
            ),
            decoration: const BoxDecoration(
              color: AppColors.kScaffoldColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.w(150),
                    height: SizeConfig.h(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(12)),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Expanded(
                        child: Container(
                          height: SizeConfig.h(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.h(20)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}