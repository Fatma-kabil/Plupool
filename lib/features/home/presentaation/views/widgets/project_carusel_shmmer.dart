import 'package:flutter/widgets.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_card_shimmer.dart';

class ProjectsCarouselShimmer extends StatelessWidget {
  const ProjectsCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
              ? SizeConfig.h(345)
              : SizeConfig.screenWidth == 800
                  ? SizeConfig.h(350)
                  : SizeConfig.screenWidth > 1000
                      ? SizeConfig.w(255)
                      : SizeConfig.screenWidth > 800
                          ? SizeConfig.w(272)
                          : SizeConfig.h(363),
          child: const ProjectCardShimmer(),
        ),
        SizedBox(height: SizeConfig.h(16)),
      ],
    );
  }
}