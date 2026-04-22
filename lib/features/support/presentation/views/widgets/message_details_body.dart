import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/companyres_contactus_details_header.dart';
import 'package:plupool/features/support/domain/entities/contact_entity.dart';

import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_details_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_section.dart';

class MessageDetailsBody extends StatelessWidget {
  const MessageDetailsBody({super.key, required this.message, });
 final ContactEntity message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      //    CompanyresContactusDetailsHeader(),
          MessageDatailsViewHeader(
            name: message.name,
            status: message.isActive!,
            imageUrl: message.imageUrl,
            location: message.address,
            phone: message.phone,
          ),
          SizedBox(height: 25),
          MessageDetailsSection(message: message.message, attachments: message.attachments),
          SizedBox(height: 25),
          MessageStatusSection(
            selected: mapMessageApiStatus(message.status),
          ),
        ],
      ),
    );
  }
}
