import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/app_drawer.dart';
import 'package:plupool/features/home/presentaation/views/admin/widgets/custom_app_bar.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/edit_our_project_body.dart';

class EditOurProjectView extends StatefulWidget {
  const EditOurProjectView({super.key, required this.project});
   final OurProjectEntity project;

  @override
  State<EditOurProjectView> createState() => _EditOurProjectViewState();
}

class _EditOurProjectViewState extends State<EditOurProjectView> {
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
            child: EditOurProjectBody(project:widget.project),
          ),
        ),
      ),
    );
  }
}

  
