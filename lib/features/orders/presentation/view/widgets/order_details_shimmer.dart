import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/theme/app_colors.dart';

class OrderDetailsShimmer extends StatelessWidget {
  const OrderDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(15),
          vertical: SizeConfig.h(10),
        ),
        child: Column(
          children: [
            /// ================= HEADER =================
            _section(
              child: Row(
                children: [
                  _circle(50),
                  SizedBox(width: SizeConfig.w(10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _box(width: double.infinity, height: 12),
                        SizedBox(height: 8),
                        _box(width: SizeConfig.w(180), height: 10),
                      ],
                    ),
                  ),
                  _box(width: SizeConfig.w(60), height: 25),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.h(15)),

            /// ================= ITEMS =================
            _section(
              child: Column(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                    child: Row(
                      children: [
                        _rectImage(),
                        SizedBox(width: SizeConfig.w(10)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _box(width: double.infinity, height: 12),
                              SizedBox(height: 8),
                              _box(width: SizeConfig.w(120), height: 10),
                            ],
                          ),
                        ),
                        _box(width: SizeConfig.w(40), height: 20),
                      ],
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: SizeConfig.h(15)),

            /// ================= STATUS =================
            _section(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _box(width: SizeConfig.w(150), height: 12),
                  SizedBox(height: 10),
                  _box(width: double.infinity, height: 45),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.h(15)),

            /// ================= FOOTER =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _box(width: SizeConfig.w(140), height: 40),
                _box(width: SizeConfig.w(140), height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ================= WRAPPER =================
  Widget _section({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.w(12)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.textFieldBorderColor),
        ),
        child: child,
      ),
    );
  }

  /// ================= BOX =================
  Widget _box({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  /// ================= IMAGE =================
  Widget _rectImage() {
    return Container(
      width: SizeConfig.w(69),
      height: SizeConfig.isWideScreen
          ? SizeConfig.w(88)
          : SizeConfig.h(88),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// ================= CIRCLE =================
  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}