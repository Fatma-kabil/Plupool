import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/map_request_sort.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/core/utils/widgets/show_custom_snackbar.dart';

import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/requested_maintenance_card.dart';

import 'package:plupool/features/services/presentation/manager/requested_cubit/requedted_cubit.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requested_state.dart';


class RequestedMaintenanceSection extends StatefulWidget {
  const RequestedMaintenanceSection({super.key});

  @override
  State<RequestedMaintenanceSection> createState() =>
      _RequestedMaintenanceSectionState();
}

class _RequestedMaintenanceSectionState
    extends State<RequestedMaintenanceSection> {
  String selected = "جديد";
  String _search = "";

  bool get isSearching => _search.isNotEmpty;

  Timer? _debounce;

  // ============================================================
  // SEARCH
  // ============================================================

  void onSearchChanged(String value) {
    setState(() => _search = value);

    _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 200),
      () {
        context.read<RequestsCubit>().getRequests(
              tab: "maintenance",
              search: value.isEmpty ? null : value,
              status: value.isEmpty ? mapSort(selected) : null,
            );
      },
    );
  }

  // ============================================================
  // CLEAR SEARCH
  // ============================================================

  void clearSearch() {
    setState(() => _search = "");

    context.read<RequestsCubit>().getRequests(
          tab: "maintenance",
          search: null,
          status: mapSort(selected),
        );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsCubit, RequestsState>(
      // ========================================================
      // LISTENER
      // ========================================================

      listener: (context, state) {
        if (state is RequestActionSuccess) {
          showCustomSnackBar(
            context: context,
            message: "تم تحديث حالة الطلب بنجاح",
            isSuccess: true,
          );
        }

        if (state is RequestActionError) {
          showCustomSnackBar(
            context: context,
            message: state.message,
            isSuccess: false,
          );
        }
      },

      // ========================================================
      // BUILDER
      // ========================================================

      builder: (context, state) {
        if (state is RequestsError) {
          return Center(
            child: ErrorText(
              message: state.message,
            ),
          );
        }

        if (state is RequestsSuccess) {
          final requests = state.requests;

          return ListView(
            children: [
              // ==================================================
              // TITLE
              // ==================================================

              Text(
                "ابحث عن شخص:",
                style: AppTextStyles.styleSemiBold16(context),
              ),

              // ==================================================
              // SEARCH
              // ==================================================

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(4),
                  vertical: SizeConfig.h(10),
                ),
                child: CustomSearchPerson(
                  hintText: "ابحث باسم العميل أو رقم الهاتف",
                  onChanged: onSearchChanged,
                ),
              ),

              // ==================================================
              // FILTER
              // ==================================================

              if (!isSearching)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(4),
                  ),
                  child: FilterOption(
                    value: selected,
                    items: const [
                      "جديد",
                      "تم التواصل",
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selected = val;
                        });

                        context.read<RequestsCubit>().getRequests(
                              tab: "maintenance",
                              status: mapSort(val),
                            );
                      }
                    },
                  ),
                ),

              SizedBox(
                height: SizeConfig.h(20),
              ),

              // ==================================================
              // REQUESTS
              // ==================================================

              if (requests.isEmpty)
                ErrorText(
                  message: "لا توجد طلبات",
                )
              else
                ...requests.map(
                  (item) => RequestedMaintenanceCard(
                    model: item,
                  ),
                ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}