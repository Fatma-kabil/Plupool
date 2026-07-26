import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/services/presentation/manager/company_service_cubit/company_service_cubit.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/company_cus_pack_card.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/company_cus_serviceses_card_shimmer.dart';

class CompanyCusPacksSection extends StatefulWidget {
  const CompanyCusPacksSection({super.key});

  @override
  State<CompanyCusPacksSection> createState() => _CompanyCusPacksSectionState();
}
class _CompanyCusPacksSectionState extends State<CompanyCusPacksSection> {
  String selected = "مجدولة";
  bool showFilter = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ابحث عن العميل:",
            style: AppTextStyles.styleSemiBold16(context),
          ),
          const SizedBox(height: 10),

          CustomSearchPerson(
            hintText: "ابحث بأسم العميل أو الموقع",
            onChanged: (value) {
              setState(() {
                showFilter = value.trim().isEmpty;
              });

              if (value.trim().isEmpty) {
                context.read<CompanyServiceCubit>().getServicesPackages(
                      status: getApiStatusProj(selected),
                    );
              } else {
                context.read<CompanyServiceCubit>().getServicesPackages(
                    //  status: getApiStatusProj(selected),
                      search: value,
                    );
              }
            },
          ),

          const SizedBox(height: 20),

          if (showFilter) ...[
            FilterOption(
              value: selected,
              items: const [
                "مجدولة",
                "قيد التنفيذ",
                "مكتمله",
              ],
              onChanged: (val) {
                if (val == null) return;

                setState(() => selected = val);

                context.read<CompanyServiceCubit>().getServicesPackages(
                      status: getApiStatusProj(val),
                    );
              },
            ),
            const SizedBox(height: 20),
          ],

          BlocBuilder<CompanyServiceCubit, CompanyServiceState>(
            buildWhen: (previous, current) =>
                current is GetServicesPackagesLoading ||
                current is GetServicesPackagesSuccess ||
                current is GetServicesPackagesFailure,
            builder: (context, state) {
              final packages =
                  context.read<CompanyServiceCubit>().servicePackages;

              if (state is GetServicesPackagesLoading &&
                  packages.isEmpty) {
                return const CompanyCusServicesCardShimmer();
              }

              if (state is GetServicesPackagesFailure) {
                return Center(
                  child: ErrorText(message: state.message),
                );
              }

              if (packages.isEmpty) {
                return const Center(
                  child: ErrorText(message: "لا توجد باقات"),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  return CompanyCusPackCard(
                    package: packages[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
