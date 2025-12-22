import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class AppbarShimmer extends StatelessWidget {
  const AppbarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        children: [
          // Avatar
          Container(
            width: SizeConfig.w(40),
            height: SizeConfig.w(40),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: SizeConfig.w(8)),

          // Name + Role
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.w(80),
                height: SizeConfig.h(8),
                color: Colors.white,
              ),
              SizedBox(height: SizeConfig.h(6)),
              Container(
                width: SizeConfig.w(50),
                height: SizeConfig.h(8),
                color: Colors.white,
              ),
            ],
          ),

         

         
        
        ],
      ),
    );
  }
}
