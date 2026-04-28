import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/functions/map_request_sort.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/error_text.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';

import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/requested_construction_card.dart';

import 'package:plupool/features/services/presentation/manager/requested_cubit/requedted_cubit.dart';
import 'package:plupool/features/services/presentation/manager/requested_cubit/requested_state.dart';

class RequestedConstructionSection extends StatefulWidget {
  const RequestedConstructionSection({super.key});

  @override
  State<RequestedConstructionSection> createState() =>
      _RequestedConstructionSectionState();
}

class _RequestedConstructionSectionState
    extends State<RequestedConstructionSection> {
  String selected = "جديد";
  String _search = "";

  bool get isSearching => _search.isNotEmpty;

  /// 🔍 search
  void onSearchChanged(String value) {
    setState(() => _search = value);

    context.read<RequestsCubit>().getRequests(
      tab: "construction",
      search: value.isEmpty ? null : value,
      status: value.isEmpty ? mapSort(selected) : null, // 🔥 الحل هنا
    );
  }

  /// ❌ clear search
  void clearSearch() {
    setState(() => _search = "");

    context.read<RequestsCubit>().getRequests(
      tab: "construction",
      status: mapSort(selected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        if (state is RequestsError) {
          return Center(child: ErrorText(message: state.message));
        }

        if (state is RequestsSuccess) {
          final requests = state.requests;

          return ListView(
            children: [
              /// 🔤 title
              Text(
                "ابحث عن شخص:",
                style: AppTextStyles.styleSemiBold16(context),
              ),

              /// 🔍 search
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

              /// 🎛 filter (يختفي أثناء البحث)
              if (!isSearching)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
                  child: FilterOption(
                    value: selected,
                    items: const ["جديد", 'تم التواصل'],
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => selected = val);

                        context.read<RequestsCubit>().getRequests(
                          tab: "construction",
                          status: mapSort(val),
                        );
                      }
                    },
                  ),
                ),

              SizedBox(height: SizeConfig.h(20)),

              /// 📦 list
              if (requests.isEmpty)
                const ErrorText(message: "لا توجد طلبات")
              else
                ...requests.map(
                  (item) => RequestedConstructionCard(model: item),
                ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
