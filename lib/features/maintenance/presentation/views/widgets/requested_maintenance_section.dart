import 'package:flutter/material.dart';
import 'package:plupool/core/constants.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/maintenance/presentation/views/widgets/requested_maintenance_card.dart';

class RequestedMaintenanceSection extends StatefulWidget {
  const RequestedMaintenanceSection({super.key});

  @override
  State<RequestedMaintenanceSection> createState() =>
      _RequestedMaintenanceSectionState();
}

class _RequestedMaintenanceSectionState
    extends State<RequestedMaintenanceSection> {
  String selected = "جديد";
  List get filteredList {
    return requestedMaintenanceCards
        .where((item) => item.statu == selected)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // عنوان البحث
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ابحث عن شخص:",
                style: AppTextStyles.styleSemiBold16(context),
              ),
            ],
          ),
        ),

        // مساحة بين العنوان وباقي العناصر
        //   SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(10))),

        // حقل البحث
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(4),
              vertical: SizeConfig.h(10),
            ),
            child: CustomSearchPerson(hintText: "ابحث باسم صاحب الخدمه"),
          ),
        ),

        // الفلتر
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: FilterOption(
              value: selected,
              items: const ['تم التواصل', "جديد"],
              onChanged: (val) {
                if (val != null) {
                  setState(() => selected = val);
                }
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: SizeConfig.h(20))),

        // لو القائمة فاضية
        if (filteredList.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
              child: Text(
                "لا توجد طلبات",
                style: AppTextStyles.styleRegular14(context),
              ),
            ),
          )
        else
          // قائمة العناصر
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return RequestedMaintenanceCard(model: filteredList[index]);
            }, childCount: filteredList.length),
          ),
      ],
    );
  }
}
