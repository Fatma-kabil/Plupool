import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/data/models/app_bar_model.dart';
import 'package:plupool/features/home/presentaation/views/widgets/offer_section.dart';
import 'package:plupool/features/home/presentaation/views/widgets/projects_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/promo_carousel.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/reviews_section.dart';
import 'package:plupool/features/home/presentaation/views/customer/widgets/customer_appbar.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.h(12), left: SizeConfig.w(15) , right: SizeConfig.w(15)),
      child: ListView(
        children: [
          CustomerAppbar(
            model: AppbarModel(
              username: "سارة",
             subtitle: "صاحب حمام سباحة",
              avatarUrl: "assets/images/customer_user.png",
             onNotificationTap: () {
             //  TODO: افتح صفحة الإشعارات
             },
            ),
         ),
  //     GuestHeader(),
          SizedBox(height: 35),
          PromoCarousel(),
          SizedBox(height: 29),
          OfferSection(offers: offers,),
          SizedBox(height: 27),
          ProjectsSection(),
          SizedBox(height: 42),
          ReviewSection(),
        ],
      ),
    );
  }
}
