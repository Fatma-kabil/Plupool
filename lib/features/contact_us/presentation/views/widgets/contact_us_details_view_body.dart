import 'package:flutter/material.dart';


class ContactUsDetailsViewBody extends StatelessWidget {
  const ContactUsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
       //   MessageDatailsViewHeader(),
         // CompanyresContactusDetailsHeader(),
          SizedBox(height: 25),
      //    MessageDetailsSection(
        //    message: MessageModel(
          //    message:
            //      "هل تقدمون خدمات بناء حمامات سباحة؟\nتفاصيل باقات الصيانة\nمكانية تخصيص باقة خاصة",
          //    role: "ممثل شركه",
            //  name: "أحمد محمد",
          //    status: MessageStatus.solved
          //  ),
         // ),
          SizedBox(height: 25),
      //    MessageStatusSection(text: "تعديل حالة الطلب",),
        ],
      ),
    );
  }
}
