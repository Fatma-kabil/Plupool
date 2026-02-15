import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/consruction_service/presentation/views/widgets/requested_construction_card.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';

class RequestedConstructionSection extends StatefulWidget {
  const RequestedConstructionSection({super.key});

  @override
  State<RequestedConstructionSection> createState() =>
      _RequestedConstructionSectionState();
}

class _RequestedConstructionSectionState
    extends State<RequestedConstructionSection> {

  String selected = "جديد";

  List get filteredList {
    return requestedMaintenanceCards
        .where((item) => item.statu == selected)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        /// عنوان
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ابحث عن شخص:",
              style: AppTextStyles.styleSemiBold16(context),
            ),
          ],
        ),

        /// بحث
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(4),
            vertical: SizeConfig.h(10),
          ),
          child: CustomSearchPerson(
            hintText: "ابحث باسم صاحب الخدمه",
          ),
        ),

        /// فلتر
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
          child: FilterOption(
            value: selected,
            items: const ["تم التواصل", "جديد"],
            onChanged: (val) {
              if (val != null) {
                setState(() => selected = val);
              }
            },
          ),
        ),

        SizedBox(height: SizeConfig.h(20)),

        /// محتوى
        if (filteredList.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: Text(
              "لا توجد طلبات",
              style: AppTextStyles.styleRegular14(context),
            ),
          )
        else
          ...filteredList.map(
            (item) => RequestedConstructionCard(model: item),
          ),
      ],
    );
  }
}
