import 'package:flutter/material.dart';
import 'package:plupool/features/home/data/models/header_model.dart';
import 'package:plupool/features/home/data/models/promo_card_model.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_card.dart';
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
          SizedBox(height: 57,),
          PromoCard(
  model: PromoCardModel(
    iconPath: "assets/icons/construct.svg",
    title: "إنشاء حمامات السباحة",
    features: [
      "ضمان 10 سنين لأي إصلاح متعلق بإنشاء الحمام",
      "فترة صيانة مجانية تصل لمدة 3 شهور بعد الإنشاء",
      "ضمان لمدة 3 سنين على الطرمبات والموتاير",
    ],
    buttonText: "احجز الآن",
    imagePath: "assets/images/phone.png",
    onButtonTap: () {
      // TODO: روح لصفحة الحجز
    },
  ),
),

        ],
      ),
    );
  }
}
