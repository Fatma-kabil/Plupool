import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerDetailsShimmer extends StatelessWidget {
  const CustomerDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _box(height: 140),

          SizedBox(height: SizeConfig.h(24)),

          _title(),
          SizedBox(height: SizeConfig.h(12)),

          Row(
            children: [
              Expanded(child: _box(height: 100)),
              SizedBox(width: SizeConfig.w(8)),
              Expanded(child: _box(height: 100)),
              SizedBox(width: SizeConfig.w(8)),
              Expanded(child: _box(height: 100)),
            ],
          ),

          SizedBox(height: SizeConfig.h(24)),

          _box(height: 320),

          SizedBox(height: SizeConfig.h(24)),

          _title(),
          SizedBox(height: SizeConfig.h(12)),

          _box(height: 130),
          SizedBox(height: SizeConfig.h(12)),
          _box(height: 130),
          SizedBox(height: SizeConfig.h(12)),
          _box(height: 130),
        ],
      ),
    );
  }

  Widget _title() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 170,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _box({required double height}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}