import 'package:flutter/material.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_footer.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_header.dart';
import 'package:plupool/features/technicains/presentation/views/widgets/tech_profile_view_middle.dart';

class TechProfileViewBody extends StatelessWidget {
  const TechProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TechProfileViewHeader(),
          TechProfileViewMiddle(),
          TechProfileViewFooter(),
        ],
      ),
    );
  }
}