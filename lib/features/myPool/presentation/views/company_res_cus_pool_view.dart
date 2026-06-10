import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/myPool/presentation/views/widgets/company_rs_cus_pool_viw_body.dart';

class CompanyResCusPoolView extends StatelessWidget {
  const CompanyResCusPoolView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(body: SafeArea(child: const CompanyRsCusPoolViwBody())),
    );
  }
}
