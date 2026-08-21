import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class VisitsViewShimmer extends StatelessWidget {
  const VisitsViewShimmer({super.key});

  Widget _box({
    required double width,
    required double height,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CustomScrollView(
        slivers: [
          // ================= Header =================
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(
                  width: SizeConfig.w(120),
                  height: SizeConfig.h(20),
                ),
                Row(
                  children: [
                    _box(
                      width: SizeConfig.w(45),
                      height: SizeConfig.h(18),
                    ),
                    SizedBox(width: SizeConfig.w(5)),
                    _box(
                      width: SizeConfig.w(22),
                      height: SizeConfig.h(22),
                      radius: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: SizeConfig.h(12)),
          ),

          // ================= Visits Table =================
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(4),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(15),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: _box(
                            width: SizeConfig.w(65),
                            height: SizeConfig.h(18),
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.w(1),
                        height: SizeConfig.h(25),
                        color: AppColors.textFieldBorderColor,
                      ),
                      Expanded(
                        child: Center(
                          child: _box(
                            width: SizeConfig.w(45),
                            height: SizeConfig.h(18),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(),

                  // Row 1
                  _visitRow(),

                  const Divider(),

                  // Row 2
                  _visitRow(),

                  const Divider(),

                  // Row 3
                  _visitRow(),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: SizeConfig.h(25)),
          ),

          // ================= Maintenance Header =================
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _box(
                      width: SizeConfig.w(100),
                      height: SizeConfig.h(20),
                    ),
                    SizedBox(width: SizeConfig.w(5)),
                    _box(
                      width: SizeConfig.w(18),
                      height: SizeConfig.h(18),
                      radius: 4,
                    ),
                  ],
                ),
                _box(
                  width: SizeConfig.w(20),
                  height: SizeConfig.h(20),
                  radius: 4,
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: SizeConfig.h(8)),
          ),

          // ================= Maintenance Cards =================
          SliverToBoxAdapter(
            child: Column(
              children: [
                _maintenanceCard(),
                _maintenanceCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _visitRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.h(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: _box(
                width: SizeConfig.w(80),
                height: SizeConfig.h(18),
              ),
            ),
          ),
          Container(
            width: SizeConfig.w(1),
            height: SizeConfig.h(35),
            color: AppColors.textFieldBorderColor,
          ),
          Expanded(
            child: Center(
              child: _box(
                width: SizeConfig.w(60),
                height: SizeConfig.h(22),
                radius: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _maintenanceCard() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.h(6),
        horizontal: SizeConfig.w(6),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(
          SizeConfig.w(10),
        ),
      ),
      child: Column(
        children: [
          // Date + time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _box(
                width: SizeConfig.w(90),
                height: SizeConfig.h(18),
              ),
              _box(
                width: SizeConfig.w(70),
                height: SizeConfig.h(18),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(20)),

          // Values
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _maintenanceItem(),
              _maintenanceItem(),
              _maintenanceItem(),
            ],
          ),

          SizedBox(height: SizeConfig.h(20)),

          // Notes
          Align(
            alignment: Alignment.centerRight,
            child: _box(
              width: SizeConfig.w(180),
              height: SizeConfig.h(15),
            ),
          ),

          SizedBox(height: SizeConfig.h(15)),

          // Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _box(
                width: SizeConfig.w(60),
                height: SizeConfig.h(18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _maintenanceItem() {
    return Column(
      children: [
        _box(
          width: SizeConfig.w(55),
          height: SizeConfig.h(14),
        ),
        SizedBox(height: SizeConfig.h(8)),
        _box(
          width: SizeConfig.w(45),
          height: SizeConfig.h(18),
        ),
      ],
    );
  }
}