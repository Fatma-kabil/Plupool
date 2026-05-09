import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class TechsViewShimmer extends StatelessWidget {
  const TechsViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER CARDS
                Row(
                  children: [
                    Expanded(child: _headerCard()),
                    SizedBox(width: SizeConfig.w(5)),
                    Expanded(child: _headerCard()),
                    SizedBox(width: SizeConfig.w(5)),
                    Expanded(child: _headerCard()),
                  ],
                ),

                SizedBox(height: SizeConfig.h(20)),

                /// TITLE + BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: SizeConfig.w(120),
                      height: SizeConfig.h(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),

                    Container(
                      width: SizeConfig.w(110),
                      height: SizeConfig.h(38),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: SizeConfig.h(20)),

                /// SEARCH
                Container(
                  width: double.infinity,
                  height: SizeConfig.h(48),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(height: SizeConfig.h(20)),

                /// FILTER
                Container(
                  width: SizeConfig.w(140),
                  height: SizeConfig.h(38),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                SizedBox(height: SizeConfig.h(20)),
              ],
            ),
          ),
        ),

        /// TECH CARDS
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                child: _techCard(),
              );
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }

  Widget _headerCard() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(14),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: SizeConfig.w(12),
            backgroundColor: Colors.grey.shade200,
          ),

          SizedBox(height: SizeConfig.h(10)),

          Container(
            width: SizeConfig.w(40),
            height: SizeConfig.h(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          SizedBox(height: SizeConfig.h(8)),

          Container(
            width: SizeConfig.w(70),
            height: SizeConfig.h(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _techCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(12),
        ),
        decoration: BoxDecoration(
          color: AppColors.kScaffoldColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.textFieldBorderColor,
          ),
        ),
        child: Column(
          children: [
            /// HEADER
            Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.w(17),
                  backgroundColor: Colors.white,
                ),

                SizedBox(width: SizeConfig.w(7)),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.w(90),
                      height: SizeConfig.h(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),

                    SizedBox(height: SizeConfig.h(8)),

                    Container(
                      width: SizeConfig.w(120),
                      height: SizeConfig.h(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Container(
                  width: SizeConfig.w(55),
                  height: SizeConfig.h(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(8)),

            Divider(
              color: AppColors.textFieldBorderColor,
            ),

            SizedBox(height: SizeConfig.h(8)),

            /// DETAILS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _item(),
                    SizedBox(height: SizeConfig.h(14)),
                    _item(width: SizeConfig.w(100)),
                  ],
                ),

                SizedBox(
                  height: SizeConfig.h(90),
                  child: const VerticalDivider(
                    color: AppColors.textFieldBorderColor,
                    thickness: 1,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _item(width: SizeConfig.w(90)),
                    SizedBox(height: SizeConfig.h(14)),
                    _item(width: SizeConfig.w(70)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({double? width}) {
    return Row(
      children: [
        CircleAvatar(
          radius: SizeConfig.w(8),
          backgroundColor: Colors.white,
        ),

        SizedBox(width: SizeConfig.w(5)),

        Container(
          width: width ?? SizeConfig.w(120),
          height: SizeConfig.h(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }
}