import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProjectCardShimmer extends StatelessWidget {
  const ProjectCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
     //   color: Colors.white,
        border: Border.all(color: const Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(12),
          vertical: SizeConfig.h(15),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// الصف الأول
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _box(
                    width: SizeConfig.w(120),
                    height: SizeConfig.h(16),
                  ),
                  _box(
                    width: SizeConfig.w(70),
                    height: SizeConfig.h(28),
                    radius: 20,
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(10)),

              _box(
                width: SizeConfig.w(160),
                height: SizeConfig.h(18),
              ),

              SizedBox(height: SizeConfig.h(8)),

              _box(
                width: SizeConfig.w(130),
                height: SizeConfig.h(14),
              ),

              SizedBox(height: SizeConfig.h(18)),

              _box(
                width: double.infinity,
                height: SizeConfig.h(45),
              ),

              SizedBox(height: SizeConfig.h(18)),

              _box(
                width: double.infinity,
                height: SizeConfig.h(80),
              ),

              SizedBox(height: SizeConfig.h(15)),

              _box(
                width: double.infinity,
                height: SizeConfig.h(45),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}