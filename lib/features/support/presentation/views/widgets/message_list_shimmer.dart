import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/utils/size_config.dart';

class MessagesListShimmer extends StatelessWidget {
  const MessagesListShimmer({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(12),
        vertical: SizeConfig.h(10),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: SizeConfig.h(10)),
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(12),
                vertical: SizeConfig.h(10),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.textFieldBorderColor),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Title
                    _box(
                      height: SizeConfig.h(14),
                      width: width * 0.4,
                    ),

                    SizedBox(height: SizeConfig.h(15)),

                    /// 🔹 Date
                    Row(
                      children: [
                        _box(
                          height: SizeConfig.h(12),
                          width: width * 0.25,
                        ),
                        const Spacer(),
                        _box(
                          height: SizeConfig.h(12),
                          width: width * 0.3,
                        ),
                      ],
                    ),

                    SizedBox(height: SizeConfig.h(10)),

                    /// 🔹 Status
                    Row(
                      children: [
                        _box(
                          height: SizeConfig.h(12),
                          width: width * 0.2,
                        ),
                        const Spacer(),
                        _box(
                          height: SizeConfig.h(22),
                          width: width * 0.25,
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.h(12),
                      ),
                      child: Divider(color: Colors.grey.shade400),
                    ),

                    /// 🔹 Attachments title
                    _box(
                      height: SizeConfig.h(12),
                      width: width * 0.3,
                    ),

                    SizedBox(height: SizeConfig.h(10)),

                    /// 🔹 Attachments
                    SizedBox(
                      height: SizeConfig.h(30),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (_, __) =>
                            SizedBox(width: SizeConfig.w(8)),
                        itemBuilder: (context, index) {
                          return _box(
                            height: SizeConfig.h(25),
                            width: width * 0.2,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: count,
        ),
      ),
    );
  }

  Widget _box({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}