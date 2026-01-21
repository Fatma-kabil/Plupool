import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/company_res.dart/presentation/views/widgets/company_res_card.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';

class CompantResViewBody extends StatefulWidget {
  const CompantResViewBody({super.key});

  @override
  State<CompantResViewBody> createState() => _CompantResViewBodyState();
}

class _CompantResViewBodyState extends State<CompantResViewBody> {
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
                    "ابحث عن ممثل الشركة:",
                    style: AppTextStyles.styleSemiBold16(context),
                  ),
                  AddOfferBtn(
                    text: "إضافة عميل",
                    onTap: () {
                      context.push('/addcompanyres');
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(4),
                  vertical: SizeConfig.h(20),
                ),
                child: const CustomSearchPerson(
                  hintText: "ابحث باسم ممثل الشركه او رقم الهاتف",
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
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.h(12)),
              child: CompanyResCard(),
            );
          }, childCount: 4),
        ),
      ],
    );
  }
}
