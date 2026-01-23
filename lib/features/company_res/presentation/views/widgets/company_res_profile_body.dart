import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_profile_view_footer.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/company_res_profile_view_header.dart';

class CompanyResProfileBody extends StatelessWidget {
  const CompanyResProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
  return  SingleChildScrollView(
      child: Column(
        children: [
          CompanyResProfileViewHeader(),
         SizedBox(height: SizeConfig.h(20)),
          CompanyResProfileViewFooter(),
        ],
      ),
    );
  }
}