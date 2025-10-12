import 'package:flutter/material.dart';
import 'package:plupool/core/utils/size_config.dart';
import 'package:plupool/features/tasks/presentation/views/widgets/tech_task_view_body.dart';

class TechTaskView extends StatelessWidget {
  const TechTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(17),
            vertical: SizeConfig.h(18),
          ),
          child: TechTaskViewBody()
        ),
      
    );
  }
}
