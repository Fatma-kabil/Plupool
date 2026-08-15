import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/company_res/presentation/views/widgets/add_company_res_client_view_body.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';

class AddCompanyResClientView extends StatefulWidget {
  const AddCompanyResClientView({super.key, required this.companyRepId});
  final int companyRepId;
  @override
  State<AddCompanyResClientView> createState() =>
      _AddCompanyResClientViewState();
}

class _AddCompanyResClientViewState extends State<AddCompanyResClientView> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: CustomAppBar(
            onPressed: () {
              scaffoldkey.currentState!.openDrawer();
            },
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),
            child: AddCompanyResClientViewBody(
              companyRepId: widget.companyRepId,
            ),
          ),
        ),
      ),
    );
  }
}
