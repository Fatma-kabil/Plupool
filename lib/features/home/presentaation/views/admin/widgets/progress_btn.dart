import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/features/store/presentation/views/widgets/Qty_Btn.dart';

class ProgressBtn extends StatelessWidget {
  const ProgressBtn({super.key, required this.status});
  final RequestStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         QtyBtn(
          icon: Icons.add,
          backgroundcolor:status==RequestStatus.completed?Color(0xffCDCDCD): Color(0xff2B8EC2),
          onTap: () {},
        ),
       
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(8)),
          child: Text(
            "تحديث التقدم",
            style: AppTextStyles.styleRegular12(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),
        QtyBtn(
          icon: Icons.remove,
          backgroundcolor:status==RequestStatus.completed?Color(0xff06D6A0): Color(0xffCDCDCD),
          onTap: () {},
        ),
      ],
    );
  }
}
