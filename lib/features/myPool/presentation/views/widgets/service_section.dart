import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card.dart';

class ServiceSection extends StatefulWidget {
  const ServiceSection({super.key});

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  String selected = "مجدولة";

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
            Spacer(),
            FilterOption(
              value: selected,
              items: const ["عاجلة", "مجدولة", "مكتملة"],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selected = val;
                  });
                }
              },
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
