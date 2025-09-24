import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/header_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/custom_header.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';

class TechHomeView extends StatelessWidget {
  const TechHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, left: 17, right: 17),
      child: ListView(
        children: [
          CustomHeader(
            model: HeaderModel(
              username: "أحمد",
             subtitle: " فني صيانه ",
              avatarUrl: "assets/images/ahmed.png",
             onNotificationTap: () {
             //  TODO: افتح صفحة الإشعارات
             },
            ),
         ),
  //     GuestHeader(),
          SizedBox(height: 35),
             ProjectsSection(),
        
        ],
      ),
    );
  }
}