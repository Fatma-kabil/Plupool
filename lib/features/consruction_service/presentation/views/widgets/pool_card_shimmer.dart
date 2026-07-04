import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class PoolCardShimmer extends StatelessWidget {
  const PoolCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kScaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xff80BBDA),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.h(10)),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الفيديو
              Container(
                width: double.infinity,
                height: SizeConfig.h(190),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              SizedBox(height: SizeConfig.h(16)),

              // العنوان
              Container(
                width: SizeConfig.w(170),
                height: SizeConfig.h(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),

              SizedBox(height: SizeConfig.h(12)),

              // الوصف
              Container(
                width: double.infinity,
                height: SizeConfig.h(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),

              SizedBox(height: SizeConfig.h(8)),

              Container(
                width: SizeConfig.w(230),
                height: SizeConfig.h(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),

              SizedBox(height: SizeConfig.h(20)),

              // زر احجز الآن
              Container(
                width: double.infinity,
                height: SizeConfig.h(48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}