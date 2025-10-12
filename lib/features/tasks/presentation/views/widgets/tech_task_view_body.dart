import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/my_task_view_card.dart';

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
        SizedBox(height: 40,),
        ListView.builder(
           shrinkWrap: true, // 👈 يمنعها من التمدد اللانهائي
          physics: const NeverScrollableScrollPhysics(), // 👈 توقف السكرول الداخلي
      itemCount: requests.length,
      itemBuilder: (context, index) {
        
        return Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.h(5)),
          child: MyTaskViewCard(request:requests[index] ),
        );
      },
    )
      ],
    );
  }
}
