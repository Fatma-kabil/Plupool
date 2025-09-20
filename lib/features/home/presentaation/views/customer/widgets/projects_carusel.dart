import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/project_card.dart';

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
    // مهم: viewportFraction = 1.0 علشان الكارد ياخد العرض كله
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
    return Column(
      children: [
        /// PageView
        SizedBox(
         
          width: double.infinity,
          height: SizeConfig.h(230),
          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: projects.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final project = projects[index];
              return ProjectCard(projects: project);
            },
          ),
        ),

        const SizedBox(height: 16),

        /// Arrows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowButton(
              icon: Icons.arrow_back,
              enabled: _currentPage > 0,
              onTap: () => _goToPage(_currentPage - 1),
            ),
            const SizedBox(width: 15),
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

/// زرار السهم
class ArrowButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const ArrowButton({
    super.key,
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: SizeConfig.h(29),
        width:  SizeConfig.w(29),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xff2B8EC2),
         
        ),
        child: Icon(
          icon,
          size: SizeConfig.w(20),
          color:  Colors.white,
        ),
      ),
    );
  }
}
