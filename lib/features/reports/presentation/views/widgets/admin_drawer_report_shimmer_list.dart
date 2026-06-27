import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class AdminDrawerReportShimmerList extends StatelessWidget {
  const AdminDrawerReportShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, __) => const AdminDrawerReportShimmerCard(),
    );
  }
}

class AdminDrawerReportShimmerCard extends StatelessWidget {
  const AdminDrawerReportShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _line(SizeConfig.w(140), 14),
                Container(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(18)),

            _row(),
            SizedBox(height: SizeConfig.h(10)),
            _row(),
            SizedBox(height: SizeConfig.h(10)),
            _row(),
            SizedBox(height: SizeConfig.h(10)),
            _row(),

            SizedBox(height: SizeConfig.h(12)),
            Divider(color: Colors.white),
            SizedBox(height: SizeConfig.h(12)),

            _line(SizeConfig.w(120), 14),

            SizedBox(height: SizeConfig.h(12)),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: SizeConfig.h(44),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.w(35)),
                CircleAvatar(
                  radius: SizeConfig.w(18),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _row() {
    return Row(
      children: [
        _line(SizeConfig.w(90), 12),
        const Spacer(),
        _line(SizeConfig.w(160), 12),
      ],
    );
  }

  Widget _line(double width, double height) {
    return Container(
      width: width,
      height: SizeConfig.h(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
