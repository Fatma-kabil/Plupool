import 'package:flutter/material.dart';
import 'package:plupool/core/utils/widgets/custom_back_button.dart';
import 'package:plupool/features/services/presentation/views/widgets/customer_construct_card.dart';
import 'package:plupool/features/services/presentation/views/widgets/design_pool_card.dart';
import 'package:plupool/features/services/presentation/views/widgets/gurantees_section.dart';
import 'package:plupool/features/services/presentation/views/widgets/pools_types_section.dart';
import 'package:plupool/features/services/presentation/views/widgets/service_banner.dart';

class ConstructionServicesView extends StatelessWidget {

  const ConstructionServicesView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft, // لو عايزة الباك باتون يطلع يمين
                child: CustomBackButton(),
              ),
              SizedBox(height: 15),
              ServiceBanner(),
              SizedBox(height: 32),
              CustomerConstructCard(),
                SizedBox(height: 16),
              GuaranteesSection(),
                 SizedBox(height: 29),
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
