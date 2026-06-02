import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class FaqSectionShimmer extends StatelessWidget {
  const FaqSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// عنوان الأسئلة الشائعة
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: SizeConfig.w(120),
            height: SizeConfig.h(18),
            decoration: BorderDecoration(),
          ),
        ),

        SizedBox(height: SizeConfig.h(15)),

        /// كارد الأسئلة
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(15),
            vertical: SizeConfig.h(14),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: index == 3 ? 0 : SizeConfig.h(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: SizeConfig.h(16),
                          decoration: BorderDecoration(),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(12)),
                      Container(
                        width: SizeConfig.w(18),
                        height: SizeConfig.w(18),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: SizeConfig.h(35)),
      ],
    );
  }
}

BoxDecoration BorderDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  );
}