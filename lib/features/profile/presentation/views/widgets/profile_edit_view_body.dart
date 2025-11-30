import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/profile/presentation/views/widgets/edit_btn.dart';
import 'package:plupool/features/profile/presentation/views/widgets/profile_avatar_picker.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_owner_info.dart';
import 'package:plupool/features/profile/presentation/views/widgets/update_tech_info.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ✅ البطاقة العلوية (الصورة والاسم والمسمى)
          SizedBox(height: SizeConfig.h(15)),
          ProfileAvatarPicker(onImagePicked: (image) {}),
          SizedBox(height: SizeConfig.h(30)),
          UpdateTechInfo(),
       //   UpdateOwnerInfo(),
          SizedBox(height: SizeConfig.h(30)),
          EditButton(
            tittle: 'حفظ المعلومات ',
            onPressed: () {
              // تنفيذ الإجراء عند الضغط على الزر
            },
          ),
          SizedBox(height: SizeConfig.h(10)),
        ],
      ),
    );
  }
}
