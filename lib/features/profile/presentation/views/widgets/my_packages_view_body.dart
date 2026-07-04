import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_service_state.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_services_cubit.dart';
import 'package:plupool/features/profile/presentation/views/widgets/active_card_task.dart';
import 'package:plupool/features/profile/presentation/views/widgets/end_card_task.dart';
import 'package:plupool/features/profile/presentation/views/widgets/soon_card_tesk.dart';

class MyPackagesViewBody extends StatefulWidget {
  const MyPackagesViewBody({super.key});

  @override
  State<MyPackagesViewBody> createState() => _MyPackagesViewBodyState();
}

class _MyPackagesViewBodyState extends State<MyPackagesViewBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserServicesCubit>().getServices(
        tab: 'packages',
        skip: 0,
        limit: 50,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserServicesCubit, UserServicesState>(
      builder: (context, state) {
        /// ----------------------------
        /// نرتب الليست ترتيب مخصص
        /// ----------------------------
        final sortedRequests = [...state.services];

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

          return getOrder(
            mapApiStatus(a.status),
          ).compareTo(
            getOrder(
              mapApiStatus(b.status),
            ),
          );
        });

        return SingleChildScrollView(
          child: Column(
            children: [
              ...sortedRequests.map((req) {
                final status = mapApiStatus(req.status);

                if (status == RequestStatus.inProgress) {
                  return Column(
                    children: [
                      ActiveCardTask(service: req),
                      SizedBox(height: SizeConfig.w(25)),
                    ],
                  );
                }

                if (status == RequestStatus.scheduled) {
                  return Column(
                    children: [
                      SoonCardTesk(service: req),
                      SizedBox(height: SizeConfig.w(25)),
                    ],
                  );
                }

                if (status == RequestStatus.completed) {
                  return Column(
                    children: [
                      EndCardTask(service: req),
                      SizedBox(height: SizeConfig.w(25)),
                    ],
                  );
                }

                return const SizedBox();
              }),
            ],
          ),
        );
      },
    );
  }
}