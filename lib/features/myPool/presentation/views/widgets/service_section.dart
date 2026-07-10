import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_service_state.dart';
import 'package:plupool/features/myPool/presentation/views/manager/user_services_cubit/user_services_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card_shimmer.dart';

class ServiceSection extends StatefulWidget {
  const ServiceSection({super.key});

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  String selected = "مجدولة";

 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserServicesCubit, UserServicesState>(
      builder: (context, state) {
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
                const Spacer(),
                FilterOption(
                  value: selected,
                  items: const ["عاجلة", "مجدولة", "مكتملة"],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selected = val;
                      });

                      context.read<UserServicesCubit>().getServices(
                        tab: 'services',
                        status: val == "مجدولة"
                            ? "scheduled"
                            : val == "عاجلة"
                            ? "urgent"
                            : "completed",
                        skip: 0,
                        limit: 50,
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: SizeConfig.h(14)),

            if (state.isLoading)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (_, __) => const MyPoolTaskCardShimmer(),
              )
            else if (state.errorMessage != null)
              Center(child: ErrorText(message: "حدث خطأ أتناء تحميل البيانات"))
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.services.length,
                itemBuilder: (context, index) {
                  return MyPoolTaskCard(service: state.services[index]);
                },
              ),
          ],
        );
      },
    );
  }
}
