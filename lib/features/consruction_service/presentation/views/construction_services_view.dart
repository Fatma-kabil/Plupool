import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/di/service_locator.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/manager/pool_types_cubit/pool_types_cubit.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/gurantees_section.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pools_types_section.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/service_banner.dart';

class ConstructionServicesView extends StatelessWidget {
  const ConstructionServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PoolTypesCubit>()..getPoolTypes(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.h(12),
              horizontal: SizeConfig.isWideScreen
                  ? SizeConfig.w(10)
                  : SizeConfig.h(14),
            ),
            child: ListView(
              children: [
                ServiceBanner(),
                SizedBox(height: 32),

                GuaranteesSection(),
                SizedBox(height: SizeConfig.h(29)),
                PoolsTypesSection(),

                //  const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
