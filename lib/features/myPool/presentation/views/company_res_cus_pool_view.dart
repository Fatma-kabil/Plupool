import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/comapny_pool_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_rs_cus_pool_viw_body.dart';

class CompanyResCusPoolView extends StatelessWidget {
  const CompanyResCusPoolView({super.key, required this.clientId});

  final int clientId;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocProvider(
      create: (_) => sl<CompanyPoolCubit>()
        ..getCompanyPools(
          clientId: 1,
          tab: "services",
          status: "scheduled",
          limit: 100,
        ),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(body: SafeArea(child: CompanyRsCusPoolViwBody())),
      ),
    );
  }
}
