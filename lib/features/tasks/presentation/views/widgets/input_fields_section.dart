import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/custom_text_field.dart';

class InputFieldsSection extends StatelessWidget {
  const InputFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "مستوى الكلور",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(8)),

          CustomTextField(icon: Icons.science, hintText: "2.6 "),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.h(4)),
            child: Text(
              "المستوى الموصى به 1.0 - 3.0 جزء في المليون",
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: Color(0xffBBBBBB)),
              textAlign: TextAlign.right,
            ),
          ),

          SizedBox(height: SizeConfig.h(15)),
          Text(
            "مستوى الحموضة",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(8)),

          CustomTextField(icon: Icons.water_drop, hintText: "2.7"),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.h(4)),
            child: Text(
              "المستوى الموصى به 7.2 - 7.6",
              style: AppTextStyles.styleRegular13(
                context,
              ).copyWith(color: Color(0xffBBBBBB)),
              textAlign: TextAlign.right,
            ),
          ),

          SizedBox(height: SizeConfig.h(15)),
          Text(
            "درجة الحرارة",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
          SizedBox(height: SizeConfig.h(8)),

          CustomTextField(icon: Icons.thermostat, hintText: "25°"),

          SizedBox(height: SizeConfig.h(15)),
        ],
      ),
    );
  }
}
