import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class MyPoolTaskCardShimmer extends StatelessWidget {
  const MyPoolTaskCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: AppColors.kScaffoldColor,
        border: Border.all(color: const Color(0xffBBBBBB)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(12),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: SizeConfig.w(120),
                        height: SizeConfig.h(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      SizedBox(height: SizeConfig.h(8)),
                      Container(
                        width: SizeConfig.w(90),
                        height: SizeConfig.h(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: SizeConfig.w(70),
                    height: SizeConfig.h(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(14)),

              Wrap(
                spacing: SizeConfig.w(16),
                runSpacing: SizeConfig.h(12),
                children: List.generate(
                  2,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width * .38,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.w(16),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: SizeConfig.w(8)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: SizeConfig.h(14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(height: SizeConfig.h(6)),
                              Container(
                                width: SizeConfig.w(45),
                                height: SizeConfig.h(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}