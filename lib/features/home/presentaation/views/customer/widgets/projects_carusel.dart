import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
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
    _pageController = PageController(viewportFraction: 0.8);
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
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            itemCount: projects.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final project = projects[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProjectCard(projects:  project),
              );
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
            const SizedBox(width: 16),
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
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: enabled ? Colors.black : Colors.grey,
          ),
        ),
        child: Icon(
          icon,
          color: enabled ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
