import 'package:flutter/material.dart';
import 'package:plupool/features/profile/presentation/views/widgets/ques_section.dart';
import 'package:plupool/features/profile/presentation/views/widgets/support_contact_card.dart';

class HelpViewBody extends StatelessWidget {
 const HelpViewBody({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuesSection(role: role),

          SupportContactCard(),
        ],
      ),
    );
  }
}
