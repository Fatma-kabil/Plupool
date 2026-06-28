import 'package:flutter/material.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';
import 'package:plupool/features/reports/presentation/views/widgets/admin_drawer_report_card.dart';
class CompanyResReportsSection extends StatelessWidget {
  const CompanyResReportsSection({
    super.key,
    required this.reports,
  });

  final List<ContactMessageEntity> reports;

  @override
  Widget build(BuildContext context) {
    
    if (reports.isEmpty) {
      return const Center(child: Text("لا توجد بلاغات"));
    }

    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (_, index) {
        return AdminDrawerReportCard(
          model: reports[index],
        );
      },
    );
  }
}