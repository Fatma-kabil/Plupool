import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomerOrderDetailsShimmer extends StatelessWidget {
  const CustomerOrderDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(width * .04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      _box(
                        width: width * .3,
                        height: 18,
                      ),
                      _box(
                        width: width * .2,
                        height: 18,
                      ),
                    ],
                  ),

                  SizedBox(height: width * .05),

                  const Divider(),

                  SizedBox(height: width * .05),

                  /// Button
                  _box(
                    width: double.infinity,
                    height: width * .12,
                  ),

                  SizedBox(height: width * .05),

                  /// Products
                  ListView.separated(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: width * .04),
                    itemBuilder: (_, __) {
                      return Row(
                        children: [
                          _box(
                            width: width * .15,
                            height: width * .15,
                          ),

                          SizedBox(width: width * .03),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                _box(
                                  width: double.infinity,
                                  height: 14,
                                ),

                                SizedBox(
                                  height: width * .02,
                                ),

                                _box(
                                  width: width * .25,
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: width * .06),

                  _box(
                    width: double.infinity,
                    height: 14,
                  ),
                  SizedBox(height: width * .03),

                  _box(
                    width: double.infinity,
                    height: 14,
                  ),
                  SizedBox(height: width * .03),

                  _box(
                    width: double.infinity,
                    height: 18,
                  ),
                ],
              ),
            ),

            SizedBox(height: width * .06),

            /// Status
            Align(
              alignment: Alignment.centerLeft,
              child: _box(
                width: width * .35,
                height: 18,
              ),
            ),

            SizedBox(height: width * .03),

            _box(
              width: double.infinity,
              height: width * .12,
            ),

            SizedBox(height: width * .06),

            /// Notes
            Align(
              alignment: Alignment.centerLeft,
              child: _box(
                width: width * .3,
                height: 18,
              ),
            ),

            SizedBox(height: width * .03),

            _box(
              width: double.infinity,
              height: width * .3,
            ),

            SizedBox(height: width * .06),

            /// Footer Buttons
            Row(
              children: [
                Expanded(
                  child: _box(
                    height: width * .12,
                  ),
                ),
                SizedBox(width: width * .04),
                Expanded(
                  child: _box(
                    height: width * .12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _box({
    double width = double.infinity,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}