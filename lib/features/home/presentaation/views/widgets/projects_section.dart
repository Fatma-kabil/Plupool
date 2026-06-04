import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
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
        Row(
          children: [
            Text(
              'مشاريعنا',
              style: AppTextStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                context.push('/usersprojectview', extra: projects);
              },
              child: Text(
                ' عرض الكل',
                style: AppTextStyles.styleBold16(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ProjectsCarousel(),
        const SizedBox(height: 30),
        // هنا هيظهر الكارد    ])],
      ],
    );
  }
}
