import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class UserShimmerList extends StatelessWidget {
  const UserShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const CustomerShimmerCard(),
        childCount: 4,
      ),
    );
  }
}

class CustomerShimmerCard extends StatelessWidget {
  const CustomerShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            /// HEADER SHIMMER
            _header(),

            SizedBox(height: SizeConfig.h(10)),

            Divider(color: Colors.white),

            SizedBox(height: SizeConfig.h(10)),

            /// DETAILS SHIMMER
            _details(),
          ],
        ),
      ),
    );
  }

  /// ================= HEADER =================
  Widget _header() {
    return Row(
      children: [
        /// avatar
        CircleAvatar(
          radius: SizeConfig.w(20),
          backgroundColor: Colors.white,
        ),

        SizedBox(width: SizeConfig.w(10)),

        /// name + phone
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 12,
              width: SizeConfig.w(120),
              color: Colors.white,
            ),
            SizedBox(height: SizeConfig.h(6)),
            Container(
              height: 10,
              width: SizeConfig.w(80),
              color: Colors.white,
            ),
          ],
        ),

        const Spacer(),

        /// status
        Container(
          height: 20,
          width: SizeConfig.w(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }

  /// ================= DETAILS =================
  Widget _details() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _item(),
        _item(),
      ],
    );
  }

  Widget _item() {
    return Column(
      children: [
        Container(
          height: 10,
          width: SizeConfig.w(90),
          color: Colors.white,
        ),
        SizedBox(height: SizeConfig.h(6)),
        Container(
          height: 10,
          width: SizeConfig.w(70),
          color: Colors.white,
        ),
      ],
    );
  }
}