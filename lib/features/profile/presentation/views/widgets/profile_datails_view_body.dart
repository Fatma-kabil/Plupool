import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/company_info_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';
import 'package:plupool/features/profile/presentation/views/widgets/owner_info_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_details_header_card.dart';
import 'package:plupool/features/profile/presentation/views/widgets/tech_info_card.dart';

class ProfileDatailsViewBody extends StatelessWidget {
  const ProfileDatailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         
          // ✅ البطاقة العلوية (الصورة والاسم والمسمى)
          ProfileDetailsHeaderCard(
            image: "assets/images/ahmed.png",
            name: "أحمد محمد",
            role: "شركه الابداع العقاري",
          ),
          SizedBox(height: SizeConfig.h(20)),
       //   TechInfoCard(),
      //    OwnerInfoCard(),
      CompanyInfoCard(),
          SizedBox(height: SizeConfig.h(35)),
         EditButton(),
          SizedBox(height: SizeConfig.h(10)),
        ],
      ),
    );
  }
}
