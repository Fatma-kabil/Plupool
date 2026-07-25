import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/profile/presentation/manager/companr_res_projects_cubit/company_res_projects_cubit.dart';
import 'package:plupool/features/profile/presentation/manager/companr_res_projects_cubit/company_res_projects_state.dart';
import 'package:plupool/features/profile/presentation/views/widgets/my_project_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/my_project_card_shimmr.dart';

class MyProjectsViewBody extends StatefulWidget {
  const MyProjectsViewBody({super.key});

  @override
  State<MyProjectsViewBody> createState() => _MyProjectsViewBodyState();
}

class _MyProjectsViewBodyState extends State<MyProjectsViewBody> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CompanyResProjectsCubit>().getCompanyProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyResProjectsCubit, CompanyProjectsState>(
      builder: (context, state) {
        if (state is GetCompanyProjectsLoading) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            separatorBuilder: (_, __) => SizedBox(height: SizeConfig.h(20)),
            itemBuilder: (_, __) => const MyProjectCardShimmer(),
          );
        }

        if (state is GetCompanyProjectsFailure) {
          return Center(child: ErrorText(message: state.message));
        }

        if (state is GetCompanyProjectsSuccess) {
          final projects = [...state.projects];

          projects.sort((a, b) {
            int getOrder(String status) {
              switch (mapApiStatus(status)) {
                case RequestStatus.inProgress:
                  return 0;
                case RequestStatus.scheduled:
                  return 1;
                case RequestStatus.completed:
                  return 2;
                default:
                  return 3;
              }
            }

            return getOrder(a.status).compareTo(getOrder(b.status));
          });

          if (projects.isEmpty) {
            return const Center(child: ErrorText(message: "لا توجد مشاريع"));
          }

          return RefreshIndicator(
            onRefresh: () => context.read<CompanyResProjectsCubit>().refresh(),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: projects.length,
              separatorBuilder: (_, __) => SizedBox(height: SizeConfig.h(20)),
              itemBuilder: (context, index) {
                return MyProjectCard(project: projects[index]);
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
