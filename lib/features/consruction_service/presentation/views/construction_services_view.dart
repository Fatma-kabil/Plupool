import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/customer_construct_card.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/design_pool_card.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/gurantees_section.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/pools_types_section.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/service_banner.dart';

class ConstructionServicesView extends StatelessWidget {
  const ConstructionServicesView({super.key});

  @override
  Widget build(BuildContext context) {
  //   SizeConfig.init(context); // 👈 لازم يتنده هنا
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.h(12),
            horizontal:SizeConfig.isWideScreen?SizeConfig.w(10):SizeConfig.h(10) ,
          ),
          child: ListView(
            children: [
              ServiceBanner(),
              SizedBox(height: 32),
              CustomerConstructCard(),
              SizedBox(height:SizeConfig.h(20) ),
              GuaranteesSection(),
              SizedBox(height: SizeConfig.h(29)),
              PoolsTypesSection(),
              DesignPoolCard(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
