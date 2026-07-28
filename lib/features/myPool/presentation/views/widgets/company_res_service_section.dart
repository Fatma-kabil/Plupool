import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/comapny_pool_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_pool_cubit/company_pool_state.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_cus_service_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/my_pool_task_card_shimmer.dart';

class CompanyResServiceSection extends StatefulWidget {
  const CompanyResServiceSection({super.key});

  @override
  State<CompanyResServiceSection> createState() =>
      _CompanyResServiceSectionState();
}

class _CompanyResServiceSectionState extends State<CompanyResServiceSection> {
  String selected = "مجدولة";

  String _getStatus(String value) {
    switch (value) {
      case "عاجلة":
        return "urgent";
      case "مكتملة":
        return "completed";
      default:
        return "scheduled";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyPoolCubit, CompanyPoolState>(
      builder: (context, state) {

        if (state is CompanyPoolLoading) {
          return Column(
            children: List.generate(
              3,
              (_) => const MyPoolTaskCardShimmer(),
            ),
          );
        }

        if (state is CompanyPoolFailure) {
          return Center(
            child: ErrorText(
              message: "حدث خطأ أثناء تحميل البيانات",
            ),
          );
        }

        if (state is! CompanyPoolSuccess) {
          return const SizedBox();
        }

        final services = state.data.items
            .where((e) => e.tab == "services")
            .toList();

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
                  style: AppTextStyles.styleBold16(context)
                      .copyWith(
                        color: AppColors.ktextcolor,
                      ),
                ),

                const Spacer(),

                FilterOption(
                  value: selected,
                  items: const [
                    "عاجلة",
                    "مجدولة",
                    "مكتملة",
                  ],
                  onChanged: (val) {
                    if (val == null) return;

                    setState(() {
                      selected = val;
                    });

                    context.read<CompanyPoolCubit>()
                        .getCompanyPools(
                          clientId: 1,
                          tab: "services",
                          status: _getStatus(val),
                          limit: 100,
                        );
                  },
                ),
              ],
            ),

            SizedBox(height: SizeConfig.h(14)),

            if (services.isEmpty)
              const Center(
                child: Text("لا يوجد خدمات"),
              )
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return CompanyCusServiceCard(
                    item: services[index],
                  );
                },
              ),
          ],
        );
      },
    );
  }
}