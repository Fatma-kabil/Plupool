import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class NotificationCardShimmer extends StatelessWidget {
  const NotificationCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(14),
        horizontal: SizeConfig.w(14),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.isWideScreen
                  ? SizeConfig.h(22)
                  : SizeConfig.w(18),
              backgroundColor: Colors.white,
            ),

            SizedBox(width: SizeConfig.w(10)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.w(180),
                    height: SizeConfig.h(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(8)),

                  Container(
                    width: double.infinity,
                    height: SizeConfig.h(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(6)),

                  Container(
                    width: SizeConfig.w(180),
                    height: SizeConfig.h(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  Row(
                    children: [
                      Container(
                        width: SizeConfig.w(16),
                        height: SizeConfig.w(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),

                      SizedBox(width: SizeConfig.w(6)),

                      Container(
                        width: SizeConfig.w(90),
                        height: SizeConfig.h(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}