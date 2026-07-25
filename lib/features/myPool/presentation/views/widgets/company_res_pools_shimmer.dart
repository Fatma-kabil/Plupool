import 'package:flutter/material.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_customer_card_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class CompanyResPoolsShimmer extends StatelessWidget {
  const CompanyResPoolsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Cards
            Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Container(
                    height: SizeConfig.h(90),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.w(4),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: SizeConfig.h(24)),

            Container(
              width: SizeConfig.w(120),
              height: SizeConfig.h(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            SizedBox(height: SizeConfig.h(12)),

            Container(
              width: double.infinity,
              height: SizeConfig.h(50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            SizedBox(height: SizeConfig.h(20)),

            Row(
              children: [
                Container(
                  width: SizeConfig.w(140),
                  height: SizeConfig.h(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Spacer(),
                Container(
                  width: SizeConfig.w(90),
                  height: SizeConfig.h(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(16)),

            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => const CompanyResCustomerCardShimmer(),
            ),
          ],
        ),
      ),
    );
  }
}