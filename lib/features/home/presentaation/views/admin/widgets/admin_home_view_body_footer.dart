import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/admin_packaes_card.dart';

class AdminHomeViewBodyFooter extends StatelessWidget {
  const AdminHomeViewBodyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'الباقات الجارية',
              style: AppTextStyles.styleSemiBold18(context),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => context.push('/seeallpackagesview'),
              child: Text(
                'عرض الكل',
                style: AppTextStyles.styleSemiBold18(context).copyWith(
                  color: AppColors.kprimarycolor,
                  decoration: TextDecoration.underline,
                   decorationColor: AppColors.kprimarycolor, // لون الخط زي النص
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.h(15)),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (requests[index].status == RequestStatus.inProgress) {
              return AdminPackaesCard(request: requests[index]);
            } else {
           return   SizedBox.shrink();
            }
          },
          itemCount: requests.length,
        ),
      ],
    );
  }
}
