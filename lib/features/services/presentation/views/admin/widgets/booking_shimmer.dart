import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class BookingShimmer extends StatelessWidget {
  const BookingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, __) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.h(8),
          horizontal: SizeConfig.w(4),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: SizeConfig.h(140), // 🔥 بدل رقم ثابت
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                SizeConfig.w(20), // 🔥 responsive radius
              ),
            ),
          ),
        ),
      ),
    );
  }
}