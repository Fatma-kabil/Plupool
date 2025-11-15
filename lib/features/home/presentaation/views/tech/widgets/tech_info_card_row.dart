import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/metric_card.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:plupool/features/auth/presentation/manager/auth_cubit/auth_state.dart';

class TechInfoCardRow extends StatelessWidget {
  const TechInfoCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final bool isGuest = authState.status == AuthStatus.guest;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: MetricCard(
                icon: "assets/icons/tasks.svg",
                value: isGuest ? "لا يوجد" : "119",
                valueTextStyle: isGuest
                    ? AppTextStyles.styleBold16(context).copyWith(
                        color: Color(0xff555555),
                      ) // استايل الجست
                    : null, // استايل الافتراضي داخل MetricCard

                label: 'مهام مكتملة',
              ),
            ),

            SizedBox(width: SizeConfig.w(6)),

            Expanded(
              flex: 1,
              child: MetricCard(
                icon: "assets/icons/week_tasks.svg",
                value: isGuest ? "لا يوجد" : "10",
                label: 'مهام الأسبوع',
                 valueTextStyle: isGuest
                    ? AppTextStyles.styleBold16(context).copyWith(
                        color: Color(0xff555555),
                      ) // استايل الجست
                    : null, 
              ),
            ),

            SizedBox(width: SizeConfig.w(6)),

            Expanded(
              flex: 1,
              child: MetricCard(
                icon: "assets/icons/Rating.svg",
                value: isGuest ? "0" : "4.8",
                label: 'التقييم',
                 valueTextStyle: isGuest
                    ? AppTextStyles.styleBold16(context).copyWith(
                        color: Color(0xff555555),
                      ) // استايل الجست
                    : null, 
              ),
            ),
          ],
        );
      },
    );
  }
}
