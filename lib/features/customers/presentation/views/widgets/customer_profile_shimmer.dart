import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class CustomerProfileShimmer extends StatelessWidget {
  const CustomerProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// 🔹 HEADER SHIMMER
          _buildHeader(),

          SizedBox(height: SizeConfig.h(20)),

          /// 🔹 MIDDLE CARD SHIMMER
          _buildMiddleCard(),

          SizedBox(height: SizeConfig.h(20)),

          /// 🔹 FOOTER LIST SHIMMER
          _buildFooterList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(16),
        vertical: SizeConfig.h(12),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: EdgeInsets.all(SizeConfig.w(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(radius: SizeConfig.w(25), backgroundColor: Colors.white),
                  SizedBox(width: SizeConfig.w(10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 10, width: double.infinity, color: Colors.white),
                        SizedBox(height: 8),
                        Container(height: 10, width: SizeConfig.w(120), color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.h(12)),
              Container(height: 10, width: double.infinity, color: Colors.white),
              SizedBox(height: 8),
              Container(height: 10, width: double.infinity, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(15)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              children: [
                Container(height: 12, width: 120, color: Colors.white),
                Spacer(),
                Container(height: 12, width: 60, color: Colors.white),
              ],
            ),
            SizedBox(height: SizeConfig.h(18)),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
                    child: Container(
                      height: SizeConfig.h(90),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(15)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: List.generate(5, (index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(15),
                vertical: SizeConfig.h(12),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(width: 20, height: 20, color: Colors.white),
                  SizedBox(width: SizeConfig.w(10)),
                  Container(height: 10, width: SizeConfig.w(120), color: Colors.white),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}