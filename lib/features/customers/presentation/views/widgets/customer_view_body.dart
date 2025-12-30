import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class CustomerViewBody extends StatefulWidget {
  const CustomerViewBody({super.key});

  @override
  State<CustomerViewBody> createState() => _CustomerViewBodyState();
}

class _CustomerViewBodyState extends State<CustomerViewBody> {
    String selected = "نشط";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ابحث عن العميل:",
                style: AppTextStyles.styleSemiBold16(context),
              ),
              AddOfferBtn(
                text: "إضافة عميل",
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(4),
              vertical: SizeConfig.h(20),
            ),
            child: const CustomSearchPerson(
              hintText: "ابحث بأسم العميل او رقم الهاتف",
            ),
          ),
          FilterOption(
            value: selected,
            items: const ["غير نشط", "نشط"],
            onChanged: (val) {
              if (val != null) {
                setState(() => selected = val);
              }
            },
          ),
          SizedBox(height: SizeConfig.h(20)),
        ],
      ),
    ),

    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
            child: Text('Customer Item $index'),
          );
        },
        childCount: 3,
      ),
    ),
  ],
);

  }
}
