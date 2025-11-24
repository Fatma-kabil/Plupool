import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plupool/core/theme/app_colors.dart';
import 'package:plupool/core/theme/app_text_styles.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/core/utils/widgets/custom_text_form_field.dart';
import 'package:plupool/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:plupool/features/search/presentation/views/widgets/search_reasult_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Expanded(child: 
            //  CustomTextFormField(icon: Icons.search,hintText: 'بحث',bordercolor: AppColors.hintTextColor,)
            const CustumSearchTextField()
              
              
              ),
              SizedBox(width: SizeConfig.w(10),),
              GestureDetector(
                
                onTap: () => context.pop(),
                child: Text('إلغاء',style: AppTextStyles.styleMedium16(context).copyWith(color: AppColors.kprimarycolor),))
            ],
          ),
           SizedBox(height:SizeConfig.h(16) ),
          Text(
            textDirection: TextDirection.rtl,
            'نتيجة البحث :',
                 style: AppTextStyles.styleSemiBold16(context).copyWith(color: AppColors.ktextcolor),
          ),
           SizedBox(height:SizeConfig.h(16) ),
          SearchResultListView(),
        ],
      ),
    );
  }
}
