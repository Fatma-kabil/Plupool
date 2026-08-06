import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/manager/technician_services_cubit/tech_services_cubit.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/customer_details_view_body.dart';

class CustomerDetailsView extends StatelessWidget {
  const CustomerDetailsView({
    super.key,
    required this.taskId,
  });

  final int taskId;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider(
      create: (_) => sl<TechnicianServicesCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(17),
              vertical: SizeConfig.h(18),
            ),
            child: CustomerDetailsViewBody(
              taskId: taskId,
            ),
          ),
        ),
      ),
    );
  }
}