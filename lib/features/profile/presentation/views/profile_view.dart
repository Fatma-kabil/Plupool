import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/company_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/owner_profile_body.dart';
import 'package:plupool/features/profile/presentation/views/widgets/tech_profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
     
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(17),vertical: SizeConfig.h(25)),
          child: CompanyProfileBody(),
        ),
      ),
    );
  }
}