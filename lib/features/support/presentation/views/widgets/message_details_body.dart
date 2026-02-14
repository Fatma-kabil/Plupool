import 'package:flutter/material.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/companyres_contactus_details_header.dart';
import 'package:plupool/features/support/data/models/message_model.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_details_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_section.dart';

class MessageDetailsBody extends StatelessWidget {
  const MessageDetailsBody({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CompanyresContactusDetailsHeader(),
          //  MessageDatailsViewHeader(),
          SizedBox(height: 25),
          MessageDetailsSection(message: message),
          SizedBox(height: 25),
          MessageStatusSection(),
        ],
      ),
    );
  }
}
