import 'package:flutter/material.dart';

class CompanyReaSupportViewBody extends StatelessWidget {
  const CompanyReaSupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //  MessageDatailsViewHeader(),
           //         CompanyResDetails(),
          SizedBox(height: 25),
       //   MessageDetailsSection(
         //   message: MessageModel(
           //   message: "إزاي أجدّد الباقة؟",
            //  role: "ممثل شركه",
           //   name: "أحمد محمد",
           //   status: MessageStatus.solved,
           //   files: true,
           // ),
         // ),
          SizedBox(height: 25),
        //  MessageStatusSection(),
        ],
      ),
    );
  }
}
