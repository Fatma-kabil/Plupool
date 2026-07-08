import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';

class MaintenancePoolsListShimmer extends StatelessWidget {
  const MaintenancePoolsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (_, __) => SizedBox(
        height: SizeConfig.h(22),
      ),
      itemBuilder: (_, __) => const MaintenancePoolCardShimmer(),
    );
  }
}

class MaintenancePoolCardShimmer extends StatelessWidget {
  const MaintenancePoolCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kScaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xff80BBDA),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageHeight = constraints.maxWidth * 0.55;

            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  Container(
                    width: double.infinity,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(12)),

                  /// Title
                  Container(
                    width: constraints.maxWidth * .6,
                    height: SizeConfig.h(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(16)),

                  /// Features
                  ...List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: SizeConfig.h(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: SizeConfig.w(18),
                            height: SizeConfig.w(18),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),

                          SizedBox(width: SizeConfig.w(8)),

                          Expanded(
                            child: Container(
                              height: SizeConfig.h(14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}