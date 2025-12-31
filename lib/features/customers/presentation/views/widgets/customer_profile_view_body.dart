import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_header.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_middle_card.dart';

class CustomerProfileViewBody extends StatelessWidget {
  const CustomerProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomerProfileViewHeader(),
          SizedBox(height: SizeConfig.h(30)),
          CustomerProfileViewMiddleCard(),
        ],
      ),
    );
  }
}
