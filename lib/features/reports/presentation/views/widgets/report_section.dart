import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/company_re_contact_us_card.dart';

class ReportSection extends StatelessWidget {
  const ReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companyContactUs.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CompanyReContactUsCard(
          model: companyContactUs[index],
          onTap: () {
            context.push('/contactusdetailsview');
          },
        );
      },
    );
  }
}