import 'package:flutter/material.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/features/customers/presentation/views/widgets/custom_search_person.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_customer_card.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_pools_header.dart';

class CompanyResPoolsViewBody extends StatelessWidget {
  const CompanyResPoolsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CompanyResPoolsHeader(),
          SizedBox(height: 20),
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5, // عدد المسابح (مثال)
            itemBuilder: (context, index) {
              return CompanyResCustomerCard();
            },
          ),
        ],
      ),
    );
  }
}
