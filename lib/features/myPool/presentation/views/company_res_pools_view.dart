import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_res_pools_view_body.dart';


class CompanyResPoolsView extends StatelessWidget {
  const CompanyResPoolsView({super.key,});
  

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.w(17),
              right: SizeConfig.w(17),
              top: SizeConfig.h(25),
             
            ),
            child: CompanyResPoolsViewBody(),
          ),
        ),
      ),
    );
  }
}