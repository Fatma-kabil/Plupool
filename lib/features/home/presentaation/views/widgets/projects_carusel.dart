import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/widgets/arrow_button.dart';
import 'package:plupool/features/home/presentaation/views/widgets/project_card.dart';

class ProjectsCarousel extends StatefulWidget {
  const ProjectsCarousel({super.key});

  @override
  State<ProjectsCarousel> createState() => _ProjectsCarouselState();
}

class _ProjectsCarouselState extends State<ProjectsCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // مهم: 
  //  viewportFraction = 1.0 
    //علشان الكارد ياخد العرض كله
    _pageController = PageController(viewportFraction: 1.0);
  }

  void _goToPage(int index) {
    if (index >= 0 && index < projects.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
     final featuredProjects = projects
    .where((project) => project.isFeatured == true)
    .toList();
    return Column(
      children: [
        /// PageView
        SizedBox(
         
          width: double.infinity,
          height: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
              ? SizeConfig.h(345)
              : SizeConfig.screenWidth == 800
              ? SizeConfig.h(350)
              : SizeConfig.screenWidth > 1000
              ? SizeConfig.w(255)
              : SizeConfig.screenWidth > 800
              ? SizeConfig.w(
                  272,
                ) // SizeConfig.screenHeight / SizeConfig.screenWidth * 0.60
              : SizeConfig.h(363),
         
          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: featuredProjects.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final project = featuredProjects[index];
              return ProjectCard(project: project);
            },
          ),
        ),

         SizedBox(height:SizeConfig.h(16) ),

        /// Arrows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowButton(
              icon: Icons.arrow_back,
              enabled: _currentPage > 0,
              onTap: () => _goToPage(_currentPage - 1),
            ),
             SizedBox(width: SizeConfig.w(15)),
            ArrowButton(
              icon: Icons.arrow_forward,
              enabled: _currentPage < projects.length - 1,
              onTap: () => _goToPage(_currentPage + 1),
            ),
          ],
        ),
      ],
    );
  }
}
