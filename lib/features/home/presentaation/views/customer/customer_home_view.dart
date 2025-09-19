import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/header_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/custom_header.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 12, left: 17, right: 17),
      child: ListView(
        children: [
          CustomHeader(
            model: HeaderModel(
              username: "سارة",
              subtitle: "صاحب حمام سباحة",
              avatarUrl: "assets/images/customer_user.png",
              onNotificationTap: () {
                // TODO: افتح صفحة الإشعارات
              },
            ),
          ),
        ],
      ),
    );
  }
}
