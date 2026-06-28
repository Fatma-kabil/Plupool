import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/company_re_contact_us_card.dart';
import 'package:plupool/features/reports/domain/entities/contact_message_entity.dart';

class CompanyResSupportSection extends StatelessWidget {
  const CompanyResSupportSection({super.key, required this.messages});

  final List<ContactMessageEntity> messages;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const Center(child: Text("لا توجد رسائل دعم"));
    }

    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (_, index) {
        return CompanyReContactUsCard(
          model: messages[index],
          onTap: () {
            context.push('/messagedetails', extra: messages[index]);
          },
        );
      },
    );
  }
}
