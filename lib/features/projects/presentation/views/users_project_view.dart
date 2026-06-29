import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/projects/domain/entities/our_project_entity.dart';
import 'package:plupool/features/projects/presentation/views/widgets/uers_projects_view_body.dart';

class UsersProjectView extends StatefulWidget {
  const UsersProjectView({super.key, required this.projects});
   final List <OurProjectEntity> projects;

  @override
  State<UsersProjectView> createState() => _UsersProjectViewState();
}

class _UsersProjectViewState extends State<UsersProjectView> {
  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.h(20),
              left:SizeConfig.w(12),
              right:SizeConfig.w(12),

            ),
            child: UsersProjectsViewBody(projects: widget.projects),
          ),
        ),
      ),
    );
  }
}