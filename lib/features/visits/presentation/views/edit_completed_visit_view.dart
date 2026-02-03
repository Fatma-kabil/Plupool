import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/visits/presentation/views/widgets/edit_completed_visit_view_body.dart';

class EditCompletedVisitView extends StatefulWidget {
  const EditCompletedVisitView({super.key});

  @override
  State<EditCompletedVisitView> createState() => _EditCompletedVisitViewState();
}

class _EditCompletedVisitViewState extends State<EditCompletedVisitView> {
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
            isSearch: false,
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
            child: EditCompletedVisitViewBody(),
          ),
        ),
      ),
    );
  }
}
