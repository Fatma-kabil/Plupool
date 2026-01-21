import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/company_res.dart/presentation/views/widgets/add_company_res_view_body.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';

class AddCompanyRes extends StatefulWidget {
  const AddCompanyRes({super.key});

  @override
  State<AddCompanyRes> createState() => _AddCompanyResState();
}

class _AddCompanyResState extends State<AddCompanyRes> {
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
            child: AddCompanyResViewBody(),
          ),
        ),
      ),
    );
  }
}
