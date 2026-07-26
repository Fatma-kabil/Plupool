import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/request_status.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/services/presentation/manager/company_service_cubit/company_service_cubit.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/company_cus_services_card.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/company_cus_serviceses_card_shimmer.dart';

class CompanyCusServicesSection extends StatefulWidget {
  const CompanyCusServicesSection({super.key});

  @override
  State<CompanyCusServicesSection> createState() =>
      _CompanyCusServicesSectionState();
}

class _CompanyCusServicesSectionState extends State<CompanyCusServicesSection> {
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
                context.read<CompanyServiceCubit>().getMaintenanceServices(
                  status: getApiStatus(selected),
                );
              } else {
                context.read<CompanyServiceCubit>().getMaintenanceServices(
                  search: value,
                );
              }
            },
          ),

          const SizedBox(height: 20),

          if (showFilter) ...[
            FilterOption(
              value: selected,
              items: const ["عاجله", "مجدولة", "قيد التنفيذ", "مكتمله"],
              onChanged: (val) {
                if (val == null) return;

                setState(() => selected = val);

                context.read<CompanyServiceCubit>().getMaintenanceServices(
                  status: getApiStatus(val),
                );
              },
            ),

            const SizedBox(height: 20),
          ],

          BlocBuilder<CompanyServiceCubit, CompanyServiceState>(
            builder: (context, state) {
              final services = context
                  .read<CompanyServiceCubit>()
                  .maintenanceServices;

              if (state is GetMaintenanceServicesLoading && services.isEmpty) {
                return const CompanyCusServicesCardShimmer();
              }

              if (state is GetMaintenanceServicesFailure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ErrorText(message: state.message),
                  ),
                );
              }

              if (services.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ErrorText(message: "لا توجد خدمات"),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return CompanyCusServicesCard(service: services[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
