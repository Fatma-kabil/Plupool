import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class OwnerOfferSectionShimmer extends StatelessWidget {
  const OwnerOfferSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
    height: SizeConfig.h(360),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const OwnerOfferCardShimmer();
      },
    ),
  );
  }
}


class OwnerOfferCardShimmer extends StatelessWidget {
  const OwnerOfferCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(left: SizeConfig.w(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(10),
            vertical: SizeConfig.h(13),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              Container(
                height: SizeConfig.isWideScreen
                    ? SizeConfig.w(173)
                    : SizeConfig.h(173),
                width: SizeConfig.w(246),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              SizedBox(height: SizeConfig.h(12)),

              // TITLE
              Container(
                height: SizeConfig.h(12),
                width: SizeConfig.w(140),
                color: Colors.grey,
              ),

              SizedBox(height: SizeConfig.h(8)),

              // DATE ROW
              Row(
                children: [
                  Container(
                    height: SizeConfig.h(10),
                    width: SizeConfig.w(100),
                    color: Colors.grey,
                  ),
                  SizedBox(width: SizeConfig.w(6)),
                  Container(
                    height: SizeConfig.h(10),
                    width: SizeConfig.w(80),
                    color: Colors.grey,
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(10)),

              // DESCRIPTION LINE 1
              Container(
                height: SizeConfig.h(10),
                width: double.infinity,
                color: Colors.grey,
              ),

              SizedBox(height: SizeConfig.h(6)),

              // DESCRIPTION LINE 2
              Container(
                height: SizeConfig.h(10),
                width: SizeConfig.w(180),
                color: Colors.grey,
              ),

              const Spacer(),

              // BUTTON
              Container(
                height: SizeConfig.h(42),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}