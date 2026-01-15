import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/orders/presentation/view/widgets/orders_list.dart';

class StoreOrderViewBody extends StatefulWidget {
  const StoreOrderViewBody({super.key});

  @override
  State<StoreOrderViewBody> createState() => _StoreOrderViewBodyState();
}

class _StoreOrderViewBodyState extends State<StoreOrderViewBody> {
  String selected = "قيد التحضير";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: FilterOption(
            value: selected,
            items: const ["تم التسليم", "جارِ التوصيل", "قيد التحضير", "ملغي"],
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  selected = val;
                });
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25)),
        SliverToBoxAdapter(
          child: Text(
            "ابحث عن العميل:",
            style: AppTextStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.ktextcolor),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: const CustomSearchPerson(
            hintText: "ابحث بأسم العميل او رقم الهاتف",
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        OrdersList(selected: selected,),
      ],
    );
  }
}
