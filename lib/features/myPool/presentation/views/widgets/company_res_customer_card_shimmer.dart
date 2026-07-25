import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class CompanyResCustomerCardShimmer extends StatelessWidget {
  const CompanyResCustomerCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(12),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.textFieldBorderColor,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: SizeConfig.w(55),
                  height: SizeConfig.w(55),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),

                SizedBox(width: SizeConfig.w(10)),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.w(120),
                        height: SizeConfig.h(14),
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
                ),

                Container(
                  width: SizeConfig.w(55),
                  height: SizeConfig.h(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(12)),
            const Divider(),
            SizedBox(height: SizeConfig.h(12)),

            Row(
              children: [
                Container(
                  width: SizeConfig.w(18),
                  height: SizeConfig.w(18),
                  color: Colors.white,
                ),
                SizedBox(width: SizeConfig.w(8)),
                Expanded(
                  child: Container(
                    height: SizeConfig.h(14),
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(14)),

            Row(
              children: [
                Container(
                  width: SizeConfig.w(18),
                  height: SizeConfig.w(18),
                  color: Colors.white,
                ),
                SizedBox(width: SizeConfig.w(8)),
                Expanded(
                  child: Container(
                    height: SizeConfig.h(14),
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(18)),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: SizeConfig.h(65),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.w(10)),
                Expanded(
                  child: Container(
                    height: SizeConfig.h(65),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}