import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/widgets/arrow_button.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/company_hader.dart';
import 'package:plupool/features/projects/presentation/views/widgets/company_project_item.dart';

class WCompanyProjectCard extends StatefulWidget {
  const WCompanyProjectCard({super.key, required this.projects});

  final List<OurProjectEntity> projects;

  @override
  State<WCompanyProjectCard> createState() => _WCompanyProjectCardState();
}

class _WCompanyProjectCardState extends State<WCompanyProjectCard> {
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
    if (index >= 0 && index < widget.projects.length) {
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
        CompanyHeader(projects: widget.projects),
        SizedBox(height: SizeConfig.h(10)),

        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight > 2 * SizeConfig.screenWidth
              ? SizeConfig.h(320)
              : SizeConfig.screenWidth == 800
              ? SizeConfig.h(325)
              : SizeConfig.screenWidth > 1000
              ? SizeConfig.w(235)
              : SizeConfig.screenWidth > 800
              ? SizeConfig.w(
                  247,
                ) // SizeConfig.screenHeight / SizeConfig.screenWidth * 0.60
              : SizeConfig.h(338),

          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: widget.projects.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final project = widget.projects[index];
              return CompanyProjectItem(project: project,);
            },
          ),
        ),

        SizedBox(height: SizeConfig.h(16)),

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
              enabled: _currentPage < widget.projects.length - 1,
              onTap: () => _goToPage(_currentPage + 1),
            ),
          ],
        ),
      ],
    );
  }
}
