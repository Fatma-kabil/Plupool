import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    required this.skills,
  });

  final String skills;

  @override
  Widget build(BuildContext context) {

    /// ✅ فصل المهارات
    final List<String> skillsList = skills
        .split(RegExp(r'[,،]| و - _'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.w(4)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff2B8EC2)),
              ),
              child: Icon(
                Icons.build_outlined,
                color: const Color(0xff2B8EC2),
                size: SizeConfig.w(18),
              ),
            ),

            SizedBox(width: SizeConfig.w(4)),

            Text(
              "المهارات",
              style: AppTextStyles.styleMedium16(
                context,
              ).copyWith(color: const Color(0xff555555)),
            ),
          ],
        ),

        SizedBox(
          height: SizeConfig.h(50),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: skillsList.length,
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
                    color: const Color(0xffCCE4F0),
                  ),
                  child: Center(
                    child: Text(
                      skillsList[index],
                      style: AppTextStyles.styleSemiBold16(
                        context,
                      ).copyWith(
                        color: AppColors.kprimarycolor,
                      ),
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