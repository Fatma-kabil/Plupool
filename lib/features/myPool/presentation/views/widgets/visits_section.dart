import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/add_note.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/in_progress_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/visit_card.dart';

class VisitsSection extends StatelessWidget {
  const VisitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final request = requests[index];

            if (request.status == RequestStatus.inProgress) {
              final progress = request.progress ?? 0;
              final visits = request.visits ?? 0;

              List<Widget> visitCards = [];

              // كارد الزيارة المجدولة (لو ما زالت ضمن عدد الزيارات)
              if (progress + 1 <= visits) {
                visitCards.add(
                  VisitCard(
                    progress: progress + 1,
                    visits: visits,
                    status: RequestStatus.scheduled,
                  ),
                );
              }

              if (progress <= visits) {
                // كارد الزيارة المكتملة مع تقرير غياب الفني
                visitCards.add(
                  VisitCard(
                    progress: progress,
                    visits: visits,
                    status: RequestStatus.completed,
                    reportTechnicianAbsence: true,
                  ),
                );
              }

              // كارد الزيارة المكتملة السابقة (لو ما زال ضمن حدود الزيارات)
              if (progress - 1 > 0) {
                visitCards.add(
                  VisitCard(
                    progress: progress - 1,
                    visits: visits,
                    status: RequestStatus.completed,
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InProgressCard(request: request),
                  SizedBox(height: SizeConfig.h(12)),
                  ...visitCards,
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        SizedBox(height: SizeConfig.h(10)),
        AddNote(),
      ],
    );
  }
}
