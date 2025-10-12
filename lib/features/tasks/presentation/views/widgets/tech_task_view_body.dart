import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';

class TechTaskViewBody extends StatelessWidget {
  const TechTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              "مهامي",
              style: AppTextStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
            Spacer(),
            FilterButton(onTap: () {
              
            },)
          ],
        ),
        SizedBox(height: 50,)
      ],
    );
  }
}
