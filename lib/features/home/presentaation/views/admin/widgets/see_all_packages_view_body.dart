import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/admin_packaes_card.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/packages_tab_bar.dart';
import 'package:plupool/features/packages/domain/entities/package_entity.dart';
import 'package:plupool/features/packages/domain/entities/subscriber_entity.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_cubit.dart';
import 'package:plupool/features/packages/presentation/manager/package_cubit/package_state.dart';

class SeeAllPackagesViewBody extends StatefulWidget {
  const SeeAllPackagesViewBody({super.key});

  @override
  State<SeeAllPackagesViewBody> createState() => _SeeAllPackagesViewBodyState();
}

class _SeeAllPackagesViewBodyState extends State<SeeAllPackagesViewBody> {
  String selectedTab = "قيد التنفيذ";
  String selected = "باقة شهرية";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PackagesCubit>().getPackages(
        status: getApiStatus(selectedTab),
      );
    });
  }

  String getApiStatus(String tab) {
    switch (tab) {
      case "قيد التنفيذ":
        return "in_progress";

      case "مجدولة":
        return "scheduled";

      case "مكتمله":
        return "completed";

      default:
        return "in_progress";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      builder: (context, state) {
        final cubit = context.read<PackagesCubit>();

        if (state is PackagesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PackagesError) {
          return Center(child: Text(state.message));
        }

        if (state is PackagesSuccess) {
          print(
            "SUCCESS => ${state.response.stats.inProgress} "
            "${state.response.stats.scheduled} "
            "${state.response.stats.completed}",
          );
          return _buildContent(context, state.response.packages, cubit);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<PackageEntity> packages,
    PackagesCubit cubit,
  ) {
    final List<Map<String, dynamic>> subscribers = [];

    for (final package in packages) {
      print("${package.nameAr} => ${package.status}");
      for (final subscriber in package.subscribers) {
        subscribers.add({
          "subscriber": subscriber,
          "packageName": package.nameAr,
          "status": package.status,
        });
      }
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "إدارة الباقات",
            style: AppTextStyles.styleSemiBold18(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),

          SizedBox(height: SizeConfig.h(15)),

          PackagesTabBar(
            selectedTab: selectedTab,
            onTabSelected: (tab) {
              setState(() {
                selectedTab = tab;
              });

              context.read<PackagesCubit>().getPackages(
                status: getApiStatus(tab),
              );
            },
            counts: {
              "قيد التنفيذ": cubit.inProgressCount,
              "مجدولة": cubit.scheduledCount,
              "مكتمله": cubit.completedCount,
            },
          ),

          SizedBox(height: SizeConfig.h(16)),

          FilterOption(
            value: selected,
            items: const ["باقة شهرية", "باقة 4 شهور", "باقة سنوية"],
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  selected = val;
                });
              }
            },
          ),

          SizedBox(height: SizeConfig.h(20)),

          if (subscribers.isEmpty)
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.h(50)),
              child: const Center(child: Text("لا توجد بيانات")),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subscribers.length,
              itemBuilder: (context, index) {
                final subscriber =
                    subscribers[index]["subscriber"] as SubscriberEntity;

                final packageName = subscribers[index]["packageName"] as String;

                final status = subscribers[index]["status"] as String? ?? "";

                return Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.h(15)),
                  child: AdminPackaesCard(
                    request: subscriber,
                    packageName: packageName,
                    status: status,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
