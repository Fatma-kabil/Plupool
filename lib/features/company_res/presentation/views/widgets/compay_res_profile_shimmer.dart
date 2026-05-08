import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CompanyResProfileShimmer extends StatelessWidget {
  const CompanyResProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// HEADER CARD
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(16),
              vertical: SizeConfig.h(12),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.textFieldBorderColor,
                width: 1,
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
                      CircleAvatar(
                        radius: SizeConfig.w(28),
                        backgroundColor: Colors.white,
                      ),

                      SizedBox(width: SizeConfig.w(8)),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _line(
                            width: SizeConfig.w(120),
                            height: SizeConfig.h(12),
                          ),

                          SizedBox(height: SizeConfig.h(8)),

                          _line(
                            width: SizeConfig.w(90),
                            height: SizeConfig.h(10),
                          ),
                        ],
                      ),

                      const Spacer(),

                      Container(
                        width: SizeConfig.w(70),
                        height: SizeConfig.h(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.h(18)),

                  _line(
                    width: SizeConfig.w(80),
                    height: SizeConfig.h(10),
                  ),

                  SizedBox(height: SizeConfig.h(10)),

                  _line(
                    width: SizeConfig.w(170),
                    height: SizeConfig.h(14),
                  ),

                  SizedBox(height: SizeConfig.h(20)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _btn(),
                      _btn(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          /// FOOTER CARDS
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.h(6),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(15),
                  vertical: SizeConfig.h(14),
                ),
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 1,
                      spreadRadius: 0,
                      color: Color(0xffCDCDCD),
                    ),
                  ],
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.w(12),
                        backgroundColor: Colors.white,
                      ),

                      SizedBox(width: SizeConfig.w(8)),

                      _line(
                        width: SizeConfig.w(120),
                        height: SizeConfig.h(12),
                      ),

                      const Spacer(),

                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: SizeConfig.w(14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _line({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _btn() {
    return Container(
      width: SizeConfig.w(140),
      height: SizeConfig.h(38),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}