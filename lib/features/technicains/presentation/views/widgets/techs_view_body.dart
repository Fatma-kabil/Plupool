import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/offers/presentation/views/widgets/add_offer_btn.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_view_body_card_header.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/techs_view_body_card.dart';

class TechsViewBody extends StatefulWidget {
  const TechsViewBody({super.key});

  @override
  State<TechsViewBody> createState() => _TechsViewBodyState();
}

class _TechsViewBodyState extends State<TechsViewBody> {
  String selected = "نشط";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TechViewBodyCardHeader(),
                  SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                // 
                  Text(
                    "ابحث عن الفني:",
                    style: AppTextStyles.styleSemiBold16(context),
                  ),
                  AddOfferBtn(
                    text: "إضافة فني",
                    onTap: () {
                         context.push('/addtechview');
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(4),
                  vertical: SizeConfig.h(20),
                ),
                child: CustomSearchPerson(
                  hintText: "ابحث بأسم الفني او رقم الهاتف",
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
              child: TechsViewBodyCard(),
            );
          }, childCount: 4),
        ),
      ],
    );
  }
}
