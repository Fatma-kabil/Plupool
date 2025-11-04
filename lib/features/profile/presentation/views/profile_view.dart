import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
     
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20),vertical: SizeConfig.h(20)),
          child: Text('This is the Profile View'),
        ),
      ),
    );
  }
}