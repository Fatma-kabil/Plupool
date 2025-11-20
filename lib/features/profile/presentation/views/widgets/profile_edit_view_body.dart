import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ✅ البطاقة العلوية (الصورة والاسم والمسمى)
         
          SizedBox(height: SizeConfig.h(20)),
          




          SizedBox(height: SizeConfig.h(35)),
          EditButton(),
          SizedBox(height: SizeConfig.h(10)),
        ],
      ),
    );
  }
}
