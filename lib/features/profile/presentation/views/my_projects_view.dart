import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/manager/companr_res_projects_cubit/company_res_projects_cubit.dart';
import 'package:plupool/features/profile/presentation/views/widgets/my_projects_view_body.dart';

class MyProjectsView extends StatelessWidget {
  const MyProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (_) => sl<CompanyResProjectsCubit>()..getCompanyProjects(),

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(17),
                vertical: SizeConfig.h(25),
              ),
              child: MyProjectsViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
