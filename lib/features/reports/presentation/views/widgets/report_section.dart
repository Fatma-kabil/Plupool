import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/features/reports/presentation/views/widgets/report_card.dart';

class ReportSection extends StatelessWidget {
  const ReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companyContactUs.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ReportCard();
      },
    );
  }
}
