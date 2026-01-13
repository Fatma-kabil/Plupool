import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: AppColors.kprimarycolor,
              size: SizeConfig.w(17),
            ),
            SizedBox(width: SizeConfig.w(6)),
            Text(
              "جدول الصيانة",
              style: AppTextStyles.styleBold16(
                context,
              ).copyWith(color: AppColors.ktextcolor),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(14)),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: requests.length,
          itemBuilder: (context, index) {
            if (requests[index].status == RequestStatus.scheduled) {
              return MyPoolTaskCard(request: requests[index]);
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
