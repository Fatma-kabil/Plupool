import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_loading_indecator.dart';

class ProfileDatailsViewBody extends StatelessWidget {
  const ProfileDatailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(child: CustomLoadingIndecator()),
          // ✅ البطاقة العلوية (الصورة والاسم والمسمى)
           //   ProfileHeaderCard(),
               SizedBox(height: SizeConfig.h(20)),
        ],
      ),
    );
  }
}

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key, required this.name, required this.role, required this.image});
  final String name;
  final String role;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.h(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: SizeConfig.w(40),
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: SizeConfig.h(10)),
          Text(name, style: AppTextStyles.styleBold16(context)),
          Text(
            role,
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
