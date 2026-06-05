import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/widgets/filter_option.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/services/presentation/views/user/widgets/company_cus_pack_card.dart';

class CompanyCusPacksSection extends StatefulWidget {
  const CompanyCusPacksSection({super.key});

  @override
  State<CompanyCusPacksSection> createState() => _CompanyCusPacksSectionState();
}

class _CompanyCusPacksSectionState extends State<CompanyCusPacksSection> {
  String selected = "مجدوله";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🧾 Title
          Text(
            "ابحث عن العميل:",
            style: AppTextStyles.styleSemiBold16(context),
          ),
          SizedBox(height: 10),
          CustomSearchPerson(
            hintText: "ابحث بأسم العميل أوالموقع",
            //  onChanged: onSearchChanged,
          ),
          SizedBox(height: 20),
          FilterOption(
            value: selected,
            items: const ["مجدوله", 'قيد التنفيذ', 'مكتمله'],
            onChanged: (val) {
              if (val != null) {
                setState(() => selected = val);
              }
            },
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CompanyCusPackCard();
            },
          ),

          /// 🔖 Tabs
        ],
      ),
    );
  }
}
