import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class CompanyCusServicesCardShimmer extends StatelessWidget {
  const CompanyCusServicesCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget shimmerItem({
      required double width,
      required double height,
      double radius = 8,
      bool circle = false,
    }) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              circle ? null : BorderRadius.circular(radius),
          shape: circle ? BoxShape.circle : BoxShape.rectangle,
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(12),
            vertical: SizeConfig.h(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// العميل + الحالة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        shimmerItem(
                          width: SizeConfig.w(120),
                          height: SizeConfig.h(18),
                        ),
                        SizedBox(height: SizeConfig.h(8)),
                        shimmerItem(
                          width: SizeConfig.w(180),
                          height: SizeConfig.h(14),
                        ),
                      ],
                    ),
                  ),
                  shimmerItem(
                    width: SizeConfig.w(70),
                    height: SizeConfig.h(28),
                    radius: 20,
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(16)),

              /// نوع الخدمة
              Row(
                children: [
                  shimmerItem(
                    width: SizeConfig.w(18),
                    height: SizeConfig.w(18),
                    circle: true,
                  ),
                  SizedBox(width: SizeConfig.w(8)),
                  shimmerItem(
                    width: SizeConfig.w(200),
                    height: SizeConfig.h(14),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(12)),

              /// التاريخ
              Row(
                children: [
                  shimmerItem(
                    width: SizeConfig.w(18),
                    height: SizeConfig.w(18),
                    circle: true,
                  ),
                  SizedBox(width: SizeConfig.w(8)),
                  shimmerItem(
                    width: SizeConfig.w(170),
                    height: SizeConfig.h(14),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.h(12)),
              const Divider(),
              SizedBox(height: SizeConfig.h(12)),

              /// الفنيين
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3.2,
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      shimmerItem(
                        width: SizeConfig.w(40),
                        height: SizeConfig.w(40),
                        circle: true,
                      ),
                      SizedBox(width: SizeConfig.w(8)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            shimmerItem(
                              width: double.infinity,
                              height: SizeConfig.h(13),
                            ),
                            SizedBox(
                              height: SizeConfig.h(6),
                            ),
                            shimmerItem(
                              width: SizeConfig.w(80),
                              height: SizeConfig.h(11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}