import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/profile/presentation/views/widgets/active_card_task.dart';
import 'package:plupool/features/profile/presentation/views/widgets/end_card_task.dart';
import 'package:plupool/features/profile/presentation/views/widgets/soon_card_tesk.dart';

class MyPackagesViewBody extends StatelessWidget {
  const MyPackagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    /// ----------------------------
    /// نرتب الليست ترتيب مخصص
    /// ----------------------------
    final sortedRequests = [...requests.where((r) => r.visits != null)];

    sortedRequests.sort((a, b) {
      int getOrder(RequestStatus status) {
        switch (status) {
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

    return SingleChildScrollView(
      child: Column(
        children: [
          ...sortedRequests.map((req) {
            if (req.status == RequestStatus.inProgress) {
              return Column(
                children: [
                  ActiveCardTask(request: req),
                  SizedBox(height: SizeConfig.w(25)),
                ],
              );
            }

            if (req.status == RequestStatus.scheduled) {
              return Column(
                children: [
                  SoonCardTesk(request: req),
                  SizedBox(height: SizeConfig.w(25)),
                ],
              );
            }

            if (req.status == RequestStatus.completed) {
              return Column(
                children: [
                  EndCardTask(request: req),
                  SizedBox(height: SizeConfig.w(25)),
                ],
              );
            }

            return const SizedBox();
          }).toList(),
        ],
      ),
    );
  }
}
