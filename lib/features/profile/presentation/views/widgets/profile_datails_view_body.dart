import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class ProfileDatailsViewBody extends StatelessWidget {
  const ProfileDatailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ✅ البطاقة العلوية (الصورة والاسم والمسمى)
          ProfileHeaderCard(),
          SizedBox(height: SizeConfig.h(20)),
        ],
      ),
    );
  }
}

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.h(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          SizedBox(height: SizeConfig.h(10)),
          Text('أحمد محمد', style: AppTextStyles.styleBold16(context)),
          Text(
            'فني صيانة حمامات سباحة',
            style: AppTextStyles.styleRegular14(
              context,
            ).copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
