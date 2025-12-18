import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/observations_card.dart';

class ObservationsGridView extends StatelessWidget {
  const ObservationsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الاختصارات :', style: AppTextStyles.styleSemiBold18(context)),
        SizedBox(height: SizeConfig.h(15)),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: observations.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.9,
             crossAxisSpacing: SizeConfig.w(12),
            mainAxisSpacing: SizeConfig.h(15),
           
          ),

          itemBuilder: (_, i) => ObservationsCard(icon:observations[i]['icon'], title: observations[i]['title'] ,),
        ),
      ],
    );
  }
}
