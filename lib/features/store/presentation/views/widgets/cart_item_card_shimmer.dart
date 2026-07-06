import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class CartItemCardShimmer extends StatelessWidget {
  const CartItemCardShimmer({super.key});

  Widget _box({
    required double width,
    required double height,
    BorderRadius? radius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(6),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.textFieldBorderColor),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                _box(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(88),
                  radius: BorderRadius.circular(10),
                ),

                SizedBox(width: SizeConfig.w(12)),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _box(
                        width: SizeConfig.w(130),
                        height: SizeConfig.h(14),
                      ),
                      SizedBox(height: SizeConfig.h(8)),
                      _box(
                        width: SizeConfig.w(90),
                        height: SizeConfig.h(14),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: SizeConfig.w(10)),

                Column(
                  children: [
                    _box(
                      width: SizeConfig.w(30),
                      height: SizeConfig.h(30),
                      radius: BorderRadius.circular(20),
                    ),
                    SizedBox(height: SizeConfig.h(6)),
                    _box(
                      width: SizeConfig.w(25),
                      height: SizeConfig.h(12),
                    ),
                    SizedBox(height: SizeConfig.h(6)),
                    _box(
                      width: SizeConfig.w(30),
                      height: SizeConfig.h(30),
                      radius: BorderRadius.circular(20),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(10)),

            Divider(color: AppColors.textFieldBorderColor),

            SizedBox(height: SizeConfig.h(8)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(
                  width: SizeConfig.w(90),
                  height: SizeConfig.h(14),
                ),
                _box(
                  width: SizeConfig.w(70),
                  height: SizeConfig.h(14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}