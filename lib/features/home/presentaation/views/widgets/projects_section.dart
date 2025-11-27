import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_carusel.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مشاريعنا',
          style: AppTextStyles.styleBold20(
            context,
          ).copyWith(color: AppColors.ktextcolor),
        ),
        const SizedBox(height: 12),
        ProjectsCarousel()
       // هنا هيظهر الكارد    ])],
      ],
    );
  }
}