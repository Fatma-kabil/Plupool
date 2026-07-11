import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_service_state.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_services_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/add_note.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/in_progress_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card_shimmer.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/service_notes_section.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/visit_card.dart';

class VisitsSection extends StatefulWidget {
  const VisitsSection({super.key});

  @override
  State<VisitsSection> createState() => _VisitsSectionState();
}

class _VisitsSectionState extends State<VisitsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<UserServicesCubit, UserServicesState>(
          builder: (context, state) {
            if (state.isLoading) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (_, __) => const MyPoolTaskCardShimmer(),
              );
            }

            if (state.errorMessage != null) {
              return Center(
                child: ErrorText(message: "حدث خطأ أتناء تحميل البيانات"),
              );
            }

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                final request = state.services[index];

                List<Widget> visitCards = [];

                if (request.nextMaintenanceDate != null &&
                    request.nextMaintenanceDate!.isNotEmpty) {
                  visitCards.add(
                    VisitCard(
                      progress: request.completedVisits + 1,
                      visits: request.visitsCount,
                      status: RequestStatus.scheduled,
                      date: request.nextMaintenanceDate!,
                      bookingId: request.id,
                      technicianNames: request.technicians
                          .map((e) => e.name)
                          .toList(),
                      technicianImages: request.technicians
                          .map((e) => e.profileImage)
                          .toList(),
                    ),
                  );
                }

                for (int i = request.visits.length - 1; i >= 0; i--) {
                  final visit = request.visits[i];

                  visitCards.add(
                    VisitCard(
                      progress: i + 1,
                      visits: request.visitsCount,
                      status: RequestStatus.completed,
                      date: visit.scheduledDate,
                      reportTechnicianAbsence: i == request.visits.length - 1,
                       bookingId: request.id,
                      technicianNames: request.technicians
                          .map((e) => e.name)
                          .toList(),
                      technicianImages: request.technicians
                          .map((e) => e.profileImage)
                          .toList(),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InProgressCard(service: request),
                    SizedBox(height: SizeConfig.h(12)),
                    Text(
                      "الزيارات",
                      style: AppTextStyles.styleBold16(
                        context,
                      ).copyWith(color: AppColors.ktextcolor),
                    ),
                    SizedBox(height: SizeConfig.h(12)),
                    ...visitCards,
                  ],
                );
              },
            );
          },
        ),

        SizedBox(height: SizeConfig.h(10)),
        const AddNote(),
        SizedBox(height: SizeConfig.h(20)),
        ServiceNotesSection(),
        SizedBox(height: SizeConfig.h(20)),
      ],
    );
  }
}
