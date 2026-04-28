import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class RequestedMaintenanceShimmer extends StatelessWidget {
  const RequestedMaintenanceShimmer({super.key});

  Widget line({double? w, double? h}) {
    return Container(
      width: w,
      height: h ?? SizeConfig.h(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
        children: [
          /// 🔤 title
          line(w: SizeConfig.w(120), h: SizeConfig.h(14)),

          SizedBox(height: SizeConfig.h(10)),

          /// 🔍 search
          Container(
            height: SizeConfig.h(45),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          SizedBox(height: SizeConfig.h(12)),

          /// 🎛 filter
          Container(
            height: SizeConfig.h(40),
            width: SizeConfig.w(140),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          /// 🧾 cards
          ...List.generate(
            3,
            (index) => Container(
              margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(15),
                vertical: SizeConfig.h(12),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔹 Header
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.h(45),
                        height: SizeConfig.h(45),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          line(w: SizeConfig.w(120)),
                          SizedBox(height: 6),
                          line(w: SizeConfig.w(90)),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.h(10)),
                  Divider(),

                  SizedBox(height: SizeConfig.h(10)),

                  /// 🔹 Rows (service info)
                  line(w: SizeConfig.w(180)),
                  SizedBox(height: 8),
                  line(w: SizeConfig.w(150)),
                  SizedBox(height: 8),
                  line(w: SizeConfig.w(130)),

                  SizedBox(height: SizeConfig.h(10)),
                  Divider(),
                  SizedBox(height: SizeConfig.h(10)),

                  /// 🔹 status + delete
                  line(w: SizeConfig.w(120)),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: SizeConfig.h(35),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(20)),
                      Container(
                        height: SizeConfig.h(35),
                        width: SizeConfig.w(60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
