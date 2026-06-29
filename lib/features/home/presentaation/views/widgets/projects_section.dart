import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/home/presentaation/views/widgets/project_carusel_shmmer.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_carusel.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  void initState() {
    super.initState();
    context.read<OurProjectsCubit>().getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurProjectsCubit, OurProjectsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return ProjectsCarouselShimmer();
        }
        if (state.error != null) {
          return Center(child: ErrorText(message: state.error!));
        }
        final projects = state.projects
            .where((offer) => offer.isHomeFeatured == 1 && offer.isActive == 1)
            .toList();

        final upProjects = state.projects
            .where((offer) => offer.isActive == 1)
            .toList();

        if (projects.isEmpty) {
          return const SizedBox();
        }

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
                    context.push('/usersprojectview', extra: upProjects);
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
            ProjectsCarousel(projects: projects),
            const SizedBox(height: 30),
            // هنا هيظهر الكارد    ]);
          ],
        );
      },
    );
  }
}
