import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/parse_time_fun.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/tasks/presentation/views/manager/technician_services_cubit/tech_services_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/manager/technician_services_cubit/technician_services_state.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_card_shimmer.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/service_tab_bar.dart';

class RequiredServicesSection extends StatefulWidget {
  const RequiredServicesSection({super.key, required this.clientId});

  final int clientId;

  @override
  State<RequiredServicesSection> createState() =>
      _RequiredServicesSectionState();
}

class _RequiredServicesSectionState extends State<RequiredServicesSection> {
  String selectedTab = "قيد التنفيذ";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TechnicianServicesCubit>().getTechnicianServices(
        clientId: widget.clientId,
        status: "in_progress",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(SizeConfig.w(12)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(SizeConfig.w(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "الخدمات المطلوبة",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(15)),

          BlocBuilder<TechnicianServicesCubit, TechnicianServicesState>(
            builder: (context, state) {
              final allRequests = state is GetTechnicianServicesSuccess
                  ? state.services.items
                  : [];

              return ServiceTabBar(
                selectedTab: selectedTab,
                onTabSelected: (tab) {
                  setState(() {
                    selectedTab = tab;
                  });
                },
                counts: {
                  "قيد التنفيذ": allRequests
                      .where(
                        (e) =>
                            e.status == "inProgress" ||
                            e.status == "in_progress",
                      )
                      .length,
                  "مجدولة": allRequests
                      .where((e) => e.status == "scheduled")
                      .length,
                },
              );
            },
          ),

          SizedBox(height: SizeConfig.h(16)),

          BlocBuilder<TechnicianServicesCubit, TechnicianServicesState>(
            builder: (context, state) {
              if (state is GetTechnicianServicesLoading) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: SizeConfig.h(12)),
                  itemBuilder: (_, __) => const ServiceCardShimmer(),
                );
              }

              if (state is GetTechnicianServicesFailure) {
                return Center(child: ErrorText(message: state.message));
              }

              if (state is GetTechnicianServicesSuccess) {
                final filteredRequests = state.services.items.where((service) {
                  if (selectedTab == "قيد التنفيذ") {
                    return service.status == "inProgress" ||
                        service.status == "in_progress";
                  }

                  return service.status == "scheduled";
                }).toList();

                filteredRequests.sort((a, b) {
                  final dateA = DateTime.parse(a.scheduledDate);
                  final dateB = DateTime.parse(b.scheduledDate);

                  if (dateA == dateB) {
                    final timeA = parseTime(a.scheduledTime);
                    final timeB = parseTime(b.scheduledTime);
                    return timeA.compareTo(timeB);
                  }

                  return dateA.compareTo(dateB);
                });

                if (filteredRequests.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.h(24)),
                    child: Center(child: ErrorText(message: "لا توجد خدمات")),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredRequests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
                      child: ServiceCard(request: filteredRequests[index]),
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
