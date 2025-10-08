import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/home/data/models/app_bar_model.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/service_request_card.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_appbar.dart';
import 'package:plupool/features/home/presentaation/views/tech/widgets/tech_info_card_row.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/store/presentation/views/widgets/filter_button.dart';

class TechHomeView extends StatelessWidget {
  const TechHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, left: 17, right: 17),
      child: ListView(
        children: [
          TechAppbar(
            model: AppbarModel(
              username: "أحمد",
              subtitle: " فني صيانه ",
              avatarUrl: "assets/images/ahmed.png",
              onNotificationTap: () {
                //   TODO: افتح صفحة الإشعارات
              },
            ),
          ),

          SizedBox(height: 30),
          TechInfoCardRow(),
          SizedBox(height: 30),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "مهام الأسبوع",
                style: AppTextStyles.styleBold20(
                  context,
                ).copyWith(color: Colors.black),
              ),
              Spacer(),
              FilterButton(onTap: () {}),
            ],
          ),
          SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // 🚫 يمنع السكرول الداخلي
            itemCount: 3,
            itemBuilder: (context, index) =>
                ServiceRequestCard(request: requests[index]),
          ),
          SizedBox(height: 30),
          OfferSection(offers: equipmentOffers),
          SizedBox(height: 30),
          ProjectsSection(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
