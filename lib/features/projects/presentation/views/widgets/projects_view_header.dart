import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/company_project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/company_project_cubit/compay_project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/project_view_header_card.dart';
import 'package:plupool/features/projects/presentation/views/widgets/projects_view_header_shimmer.dart';
class ProjectsViewHeader extends StatelessWidget {
  const ProjectsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyProjectCubit, CompanyProjectState>(
      builder: (context, state) {

        if (state.isLoading && state.statistics == null) {
          return const ProjectsViewHeaderShimmer();
        }

        if (state.error != null && state.statistics == null) {
          return Center(
            child: ErrorText(
              message: state.error!,
            ),
          );
        }

        if (state.statistics != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ProjectViewHeaderCard(
                  icon: Icons.folder_outlined,
                  value: state.statistics!.totalProjects.toString(),
                  label: 'إجمالي المشاريع',
                  bkColor: const Color(0xffFFECD2),
                  iconColor: const Color(0xffFF9F1C),
                ),
              ),

              SizedBox(width: SizeConfig.w(5)),

              Expanded(
                child: ProjectViewHeaderCard(
                  icon: Icons.pending_actions_rounded,
                  value: state.statistics!.inProgress.toString(),
                  label: 'قيد التنفيذ',
                  bkColor: const Color(0xffCCF0F7),
                  iconColor: const Color(0xff00B4D8),
                ),
              ),

              SizedBox(width: SizeConfig.w(5)),

              Expanded(
                child: ProjectViewHeaderCard(
                  icon: Icons.check_circle_outline,
                  value: state.statistics!.completed.toString(),
                  label: 'مكتمل',
                  bkColor: const Color(0xffCDF7EC),
                  iconColor: const Color(0xff05B285),
                ),
              ),
            ],
          );
        }

        return const ProjectsViewHeaderShimmer();
      },
    );
  }
}