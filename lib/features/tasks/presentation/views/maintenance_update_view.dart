import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/maintenance_update_view_body.dart';

class MaintenanceUpdateView extends StatelessWidget {
  const MaintenanceUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(17),
            vertical: SizeConfig.h(18),
          
          ),
          child:MaintenanceUpdateViewBody() ,
        ),
      ),
    );
  }
}
