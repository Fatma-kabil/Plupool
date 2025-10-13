import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/show_full_width_bottom_sheet.dart';
import 'package:plupool/core/utils/widgets/filter_button.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/my_task_view_card.dart';

import '../../../../../core/constants.dart';

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
            FilterButton(
              onTap: () {
                showFullWidthBottomSheet(context);
              },
            ),
          ],
        ),
        SizedBox(height: 40),
        //  MyTaskViewCard(request: requests[0])
        // ✅ ListView.builder داخل ListView — لازم shrinkWrap و no scroll physics
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final request = requests[index];

            // ✅ استخدمي if بشكل عادي داخل body
            if (request.status == RequestStatus.completed) {
              return const SizedBox.shrink();
            } else {
              return MyTaskViewCard(request: request);
            }
          },
        ),
      ],
    );
  }
}
