import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';

class AddressCardShimmer extends StatelessWidget {
  const AddressCardShimmer({super.key});

  Widget _line({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.h(15)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(15),
        vertical: SizeConfig.h(15),
      ),
      decoration: BoxDecoration(
        color: const Color(0xffCCE4F0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                _line(
                  width: SizeConfig.w(140),
                  height: SizeConfig.h(18),
                ),
                const Spacer(),
                _line(
                  width: SizeConfig.w(55),
                  height: SizeConfig.h(18),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(18)),

            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: SizeConfig.w(18),
                  height: SizeConfig.w(18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: SizeConfig.w(8)),
                Expanded(
                  child: _line(
                    width: double.infinity,
                    height: SizeConfig.h(14),
                  ),
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(14)),

            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: SizeConfig.w(18),
                  height: SizeConfig.w(18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: SizeConfig.w(8)),
                _line(
                  width: SizeConfig.w(170),
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