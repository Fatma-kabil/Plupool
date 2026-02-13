import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List skills = ['بناء', 'تنظيف', 'صيانه'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.w(4)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff2B8EC2)),
              ),

              child: Icon(
                Icons.build_outlined,
                color: Color(0xff2B8EC2),
                size: SizeConfig.w(18),
              ),
            ),
            SizedBox(width: SizeConfig.w(4)),
            Text(
              "المهارات",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: Color(0xff555555)),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.h(50),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(6),
                    vertical: SizeConfig.h(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(12),
                    vertical: SizeConfig.h(4),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffCCE4F0),
                  ),
                  child: Center(
                    child: Text(
                      skills[index],
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(color: AppColors.kprimarycolor),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
