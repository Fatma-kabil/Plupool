import 'package:flutter/material.dart';
import 'package:plupool/features/customers/presentation/views/widgets/customer_profile_view_header.dart';

class CustomerProfileViewBody extends StatelessWidget {
  const CustomerProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [CustomerProfileViewHeader()]),
    );
  }
}
