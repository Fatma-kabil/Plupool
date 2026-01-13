import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/profile/presentation/views/widgets/my_project_card.dart';

class MyProjectsViewBody extends StatelessWidget {
  const MyProjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sortedRequests = [...projs.where((r) => r.progress != null)];

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
          ...sortedRequests.map((p) => Column(
                children: [
                  MyProjectCard(project: p),
                  SizedBox(height: SizeConfig.w(25)),
                ],
              )),
        ],
      ),
    );
  }
}
