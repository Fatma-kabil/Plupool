import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_clients_cubit/company_clients_cubit.dart';
import 'package:plupool/features/myPool/presentation/views/manager/company_clients_cubit/company_clients_state.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_customer_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_customer_card_shimmer.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_pools_header.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_pools_shimmer.dart';

class CompanyResPoolsViewBody extends StatelessWidget {
  const CompanyResPoolsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyClientsCubit, CompanyClientsState>(
      builder: (context, state) {
        if (state is GetClientsLoading) {
         return const CompanyResPoolsShimmer();
        }

        if (state is GetClientsFailure) {
          return Center(child: Text(state.message));
        }

        if (state is! GetClientsSuccess && state is! SearchClientsLoading) {
          return const SizedBox();
        }

        final cubit = context.read<CompanyClientsCubit>();
        final response = cubit.response!;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyResPoolsHeader(stats: response.stats),
              const SizedBox(height: 20),

              Text(
                "ابحث عن العميل:",
                style: AppTextStyles.styleSemiBold16(context),
              ),

              const SizedBox(height: 10),

              CustomSearchPerson(
                hintText: "ابحث باسم العميل أو الموقع",
                onChanged: (value) {
                  cubit.getClients(search: value, isSearch: true);
                },
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Text(
                    "قائمة المسابح (${response.total})",
                    style: AppTextStyles.styleBold18(
                      context,
                    ).copyWith(color: AppColors.ktextcolor),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.push('/compayrescustmerserviceview');
                    },
                    child: Text(
                      "عرض الخدمات",
                      style: AppTextStyles.styleBold16(context).copyWith(
                        color: AppColors.kprimarycolor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              BlocBuilder<CompanyClientsCubit, CompanyClientsState>(
                buildWhen: (previous, current) =>
                    current is GetClientsSuccess ||
                    current is SearchClientsLoading,
                builder: (context, state) {
                  if (state is SearchClientsLoading) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (_, __) =>
                          const CompanyResCustomerCardShimmer(),
                    );
                  }

                  if (response.items.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(child: ErrorText(message: "لا يوجد عملاء")),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: response.items.length,
                    itemBuilder: (context, index) {
                      return CompanyResCustomerCard(
                        client: response.items[index],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
