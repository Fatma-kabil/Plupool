import 'package:flutter/material.dart';
import 'package:plupool/core/utils/functions/message_status_text.dart';
import 'package:plupool/features/contact_us/presentation/views/widgets/companyres_contactus_details_header.dart';
import 'package:plupool/features/support/data/models/message_model.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_datails_view_header.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_details_section.dart';
import 'package:plupool/features/support/presentation/views/widgets/message_status_section.dart';

class ContactUsDetailsViewBody extends StatelessWidget {
  const ContactUsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MessageDatailsViewHeader(),
         // CompanyresContactusDetailsHeader(),
          SizedBox(height: 25),
          MessageDetailsSection(
            message: MessageModel(
              message:
                  "هل تقدمون خدمات بناء حمامات سباحة؟\nتفاصيل باقات الصيانة\nمكانية تخصيص باقة خاصة",
              role: "ممثل شركه",
              name: "أحمد محمد",
              status: MessageStatus.solved
            ),
          ),
          SizedBox(height: 25),
          MessageStatusSection(text: "تعديل حالة الطلب",),
        ],
      ),
    );
  }
}
