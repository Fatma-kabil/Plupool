import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_cubit.dart';
import 'package:plupool/features/projects/presentation/manager/project_cubit/project_state.dart';
import 'package:plupool/features/projects/presentation/views/widgets/add_new_our_project_card.dart';
import 'package:plupool/features/projects/presentation/views/widgets/our_project_card.dart';
class OurProjectSection extends StatelessWidget {
  const OurProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is OurProjectsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OurProjectsError) {
          return Center(child: Text(state.message));
        }

        if (state is OurProjectsSuccess) {
          final projects = state.projects;

          return CustomScrollView(
            slivers: [
              /// Header
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المشاريع :",
                      style: AppTextStyles.styleBold16(context)
                          .copyWith(color: AppColors.ktextcolor),
                    ),
                    AddOfferBtn(
                      text: "إضافة مشروع جديد",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AddNewOurProjectCard(),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child: SizedBox(height: SizeConfig.h(20)),
              ),

              /// Empty
              if (projects.isEmpty)
                SliverToBoxAdapter(
                  child: Center(
                    child: Text("لا توجد مشاريع"),
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final project = projects[index];

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: SizeConfig.h(12),
                        ),
                        child: OurProjectCard(
                          project: project,
                        ),
                      );
                    },
                    childCount: projects.length,
                  ),
                ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}