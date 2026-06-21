import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/customers/domain/entities/user_details_entity.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/projects/presentation/views/widgets/company_res_project_view_body.dart';

class CompanyResProjectView extends StatefulWidget {
  const CompanyResProjectView({super.key, required this.user});
  final UserDetailsEntity user;

  @override
  State<CompanyResProjectView> createState() => _CompanyResProjectViewState();
}

class _CompanyResProjectViewState extends State<CompanyResProjectView> {
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
            isSearch: false,
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.w(13),
              vertical: SizeConfig.h(15),
            ),
            child: CompanyResProjectViewBody(companyResId:widget.user.user.id,activeProjects: widget.user.user.activeProjects??0,completedProjects: widget.user.user.completedProjects??0 ,),
          ),
        ),
      ),
    );
  }
}

