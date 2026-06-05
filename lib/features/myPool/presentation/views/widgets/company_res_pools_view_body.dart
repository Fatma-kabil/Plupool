import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
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
           Row(
          children: [
            Text("قائمة المسابح",style:AppTextStyles.styleBold18(context).copyWith(color: AppColors.ktextcolor)),
            Spacer(),
             GestureDetector(
                onTap: () {
                  context.push('/compayrescustmerserviceview');
                },
                child: Text(
                  "عرض الخدمات",
                  style: AppTextStyles.styleBold16(context).copyWith(
                    color: AppColors.kprimarycolor,
                    decoration: TextDecoration.underline, // ✅ الخط تحت النص
                  ),
                ),
              ),
          ],
        ),
         SizedBox(height: 10),
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
