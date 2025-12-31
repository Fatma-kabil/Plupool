import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_footer.dart';
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
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.w(15),vertical:SizeConfig.h(30) ),
            child: CustomerProfileViewMiddleCard(),
          ),
          CustomerProfileViewFooter(),
        ],
      ),
    );
  }
}
