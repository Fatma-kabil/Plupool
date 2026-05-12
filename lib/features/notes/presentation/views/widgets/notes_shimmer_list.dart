import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotesShimmerList extends StatelessWidget {
  const NotesShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;
        final itemCount = isTablet ? 6 : 4;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.h(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(isTablet ? 20 : 16),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.textFieldBorderColor,
                ),
                color: AppColors.kScaffoldColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Date
                    Container(
                      height: isTablet ? 14 : 12,
                      width: isTablet ? 160 : 120,
                      color: Colors.white,
                    ),

                    SizedBox(height: SizeConfig.h(15)),

                    /// Text lines
                    Container(
                      height: isTablet ? 14 : 12,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: isTablet ? 14 : 12,
                      width: double.infinity * (isTablet ? 0.85 : 0.75),
                      color: Colors.white,
                    ),

                    SizedBox(height: SizeConfig.h(15)),

                    /// Attachments
                    Row(
                      children: List.generate(
                        isTablet ? 4 : 3,
                        (i) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: isTablet ? 90 : 70,
                          height: isTablet ? 30 : 25,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.h(15)),

                    /// Actions
                    Row(
                      children: [
                        Container(
                          width: isTablet ? 24 : 20,
                          height: isTablet ? 24 : 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: isTablet ? 24 : 20,
                          height: isTablet ? 24 : 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}