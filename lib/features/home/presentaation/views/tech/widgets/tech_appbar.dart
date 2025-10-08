import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/app_bar_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/app_bar_details.dart';
import 'package:plupool/features/home/presentaation/views/widgets/notification_button.dart';

class TechAppbar extends StatelessWidget {
  const TechAppbar({super.key, required this.model});
  final AppbarModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 🔔 أيقونة الإشعارات
        NotificationButton(onTap: model.onNotificationTap),
        SizedBox(width: 10),
       

        const Spacer(),

        // 👤 النصوص + الصورة
        AppBarDetails(model: model),
      ],
    );
  }
}
