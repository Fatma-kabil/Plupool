import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/features/support/data/models/message_model.dart';
import 'package:plupool/features/support/presentation/views/widgets/company_res_details.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_details_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_section.dart';

class CompanyReaSupportViewBody extends StatelessWidget {
  const CompanyReaSupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MessageDatailsViewHeader(),
          //          CompanyResDetails(),
          SizedBox(height: 25),
          MessageDetailsSection(
            message: MessageModel(
              message: "إزاي أجدّد الباقة؟",
              role: "ممثل شركه",
              name: "أحمد محمد",
              status: MessageStatus.solved,
              files: true,
            ),
          ),
          SizedBox(height: 25),
          MessageStatusSection(),
        ],
      ),
    );
  }
}
