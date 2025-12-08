import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/domain/entities/request_status.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/in_progress_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/schedualed_card.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/progress_section.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/reminder_section.dart';

class VisitsSection extends StatelessWidget {
  const VisitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: requests.length,
        itemBuilder: (context, index) {
          if (requests[index].status == RequestStatus.inProgress) {
            return Column(
              children: [
                InProgressCard(request: requests[index],),
                SizedBox(height: SizeConfig.h(12)),
                SchedualedCard(progress: requests[index].progress!+1,visits: requests[index].visits! ,),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),]
    );
  }
}
