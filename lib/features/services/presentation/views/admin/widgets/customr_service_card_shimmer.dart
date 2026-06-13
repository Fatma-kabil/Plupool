import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerServiceCardShimmer extends StatelessWidget {
  const CustomerServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(8),
      ),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.w(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
              color: Colors.black12,
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Top row
              Row(
                children: [
                  Container(
                    height: SizeConfig.h(14),
                    width: SizeConfig.w(120),
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Container(
                    height: SizeConfig.h(14),
                    width: SizeConfig.w(60),
                    color: Colors.white,
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(12)),

              /// 🔹 Line 1
              Container(
                height: SizeConfig.h(12),
                width: double.infinity,
                color: Colors.white,
              ),

              SizedBox(height: SizeConfig.h(8)),

              /// 🔹 Line 2
              Container(
                height: SizeConfig.h(12),
                width: SizeConfig.w(180),
                color: Colors.white,
              ),

              SizedBox(height: SizeConfig.h(12)),

              /// 🔹 Bottom tag/button
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: SizeConfig.h(25),
                  width: SizeConfig.w(80),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
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